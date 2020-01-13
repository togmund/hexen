defmodule Hexen.HexWorker do
  @moduledoc """
    Module Documentation
  """
  use GenServer

  def start_link(args) do
    # IO.inspect(args)
    GenServer.start_link(__MODULE__, args, name: via_tuple(args[:name]))
  end

  def init(state) do
    Kernel.send(self(), :hex_fetch)
    {:ok, state}
  end

  def handle_info(:hex_fetch, state) do
    updated_state =
      state
      |> Map.get(:id)
      |> retrieve_state()
      |> update_state(state)

    broadcast(updated_state, :ok, "SET_BOARD")
    broadcast(updated_state, :ok, "SET_HEX")
    broadcast(updated_state, :ok, "SET_HAND")
    broadcast(updated_state, :ok, "GET_CARD")

    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  def get_action(deck_card_id) do
    # DeckCard ID for the card selected

    case deck_card_id do
      nil ->
        nil

      _ ->
        deck_card_id
        |> Hexen.Inventory.get_card_id_by_deck_card()
        |> List.first()
        |> Hexen.Inventory.get_card!()
        |> Map.take([:suit, :modifier])
    end
  end

  def perform_action(_room_name, deck_card_id, user_id, target_hex_id, target_user_id) do
    action = get_action(deck_card_id)
    suit = action[:suit]
    modifier = action[:modifier]

    case suit do
      "Combat" ->
        combat(modifier, user_id, target_hex_id, target_user_id)

      "Move" ->
        move(modifier, user_id, target_hex_id)

      "Gather" ->
        gather(modifier, user_id, target_hex_id)

      "Explore" ->
        explore(modifier, target_hex_id)

      "Interact" ->
        interact(modifier, user_id, target_hex_id)

      "Craft" ->
        craft(modifier, user_id, target_hex_id)

      _ ->
        nil
    end
  end

  def combat(_modifier, user_id, _target_hex_id, target_user_id) do
    # Challenges a local player to a duel

    if Enum.random(1..3) == 3 do
      new_card = Hexen.Inventory.create_random_explore_card()
      user_deck_id = List.first(Hexen.Inventory.get_users_deck_id_as_list(user_id))

      Hexen.Inventory.create_deck_card(%{
        deck_id: user_deck_id,
        card_id: Map.take(new_card, [:id])
      })
    end

    # Winner wins an Explore card
    # Modifier indicates quality of added card?
  end

  def move(_modifier, user_id, target_hex_id) do
    # Moves to a tile
    # Adds an Interact, Explore or Move card to your deck
    # Modifier indicates quality of added card?
    active_hex = Hexen.Map.get_active_hex_id_for_user(user_id)

    active_hex
    |> Hexen.Map.update_player_departure(NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second))

    Hexen.Map.create_hex_user(%{hex_id: target_hex_id, user_id: user_id})
  end

  def gather(_modifier, user_id, _target_hex_id) do
    # Gathers the active resource
    resource =
      Hexen.Map.get_active_hex_id_for_user(user_id)
      |> Hexen.Map.get_resource_by_hex_id()

    # Take one of the possible cards to craft
    card_id =
      Hexen.Inventory.get_card_ids_by_suit_list_and_resource(["Craft"], resource)
      |> Enum.shuffle()
      |> List.first()

    # Add to current_deck's deck_card
    deck_id = Hexen.Inventory.get_users_deck_id_as_list(user_id) |> List.first()

    Hexen.Inventory.create_deck_card(%{deck_id: deck_id, card_id: card_id})
  end

  def explore(_modifier, _target_hex_id) do
    # TO DO
    # Highlights a Tile with a Quest
    # Quests, on completion, add new recipies to be crafted
    IO.puts("You selected an exploration card!")
  end

  def interact(_modifier, user_id, _target_hex_id) do
    # TO DO
    # Adds an explore card to your deck
    # Or does something else complex
    if Enum.random(1..3) == 3 do
      new_card = Hexen.Inventory.create_random_explore_card()
      user_deck_id = List.first(Hexen.Inventory.get_users_deck_id_as_list(user_id))

      Hexen.Inventory.create_deck_card(%{
        deck_id: user_deck_id,
        card_id: Map.take(new_card, [:id])
      })
    end
  end

  def craft(_modifier, user_id, _target_hex_id) do
    # Compile List of possible cards to consume
    deck_id = Hexen.Inventory.get_users_deck_id_as_list(user_id) |> List.first()
    consumable_cards = Hexen.Inventory.get_deck_card_ids_by_suit(deck_id, "Craft")

    cond do
      # List possible cards to craft
      # Take one of them
      # Add to current_deck's deck_card
      # Delete the consumed cards from the player's deck

      # TODO: Recipies to filter this list by those craftable by user and craftable by way of the resource/craft cards in this user's deck
      length(consumable_cards) < 2 ->
        card_id =
          Hexen.Inventory.get_card_ids_by_suit_list(["Gather"])
          |> Enum.shuffle()
          |> List.first()

        Hexen.Inventory.create_deck_card(%{deck_id: deck_id, card_id: card_id})
        |> IO.inspect()

      length(consumable_cards) == 2 ->
        card_id =
          Hexen.Inventory.get_card_ids_by_suit_list(["Gather", "Move"])
          |> Enum.shuffle()
          |> List.first()

        Hexen.Inventory.create_deck_card(%{deck_id: deck_id, card_id: card_id})
        |> IO.inspect()

        consumable_cards
        |> Enum.shuffle()
        |> Enum.slice(0..1)
        |> Hexen.Inventory.delete_deck_cards()
        |> IO.inspect()

      length(consumable_cards) > 2 ->
        card_id =
          Hexen.Inventory.get_card_ids_by_suit_list(["Gather", "Move", "Combat"])
          |> Enum.shuffle()
          |> List.first()

        Hexen.Inventory.create_deck_card(%{deck_id: deck_id, card_id: card_id})
        |> IO.inspect()

        consumable_cards
        |> Enum.shuffle()
        |> Enum.slice(0..2)
        |> Hexen.Inventory.delete_deck_cards()
        |> IO.inspect()
    end
  end

  def draw_cards(deck_id) do
    drawn_cards =
      deck_id
      |> Hexen.Inventory.list_undrawn_deck_cards()
      |> Enum.shuffle()
      |> Enum.slice(0..2)

    cond do
      length(drawn_cards) < 3 ->
        Hexen.Inventory.shuffle_discard_into_deck(deck_id)

        [
          %{
            deck_card_id: nil,
            card_details:
              Map.take(Hexen.Inventory.get_card!(1), [
                :description,
                :id,
                :image,
                :name,
                :modifier,
                :suit
              ])
          }
        ]

      length(drawn_cards) == 3 ->
        drawn_cards
        |> Enum.each(fn hand_card_id ->
          Hexen.Inventory.update_drawn_status(Hexen.Inventory.get_deck_card!(hand_card_id), true)
        end)

        drawn_cards
        |> Enum.map(fn deck_card_id ->
          %{
            deck_card_id: deck_card_id,
            card_details:
              Hexen.Inventory.card_details_from_deck_card_id(deck_card_id)
              |> List.first()
              |> Map.take([:description, :id, :image, :name, :modifier, :suit])
          }
        end)
    end
  end

  defp retrieve_state(id) do
    tile_info = Hexen.Map.get_single_tile(id)

    player_info =
      id
      |> Hexen.Map.list_hex_user_ids_by_hex()
      |> Enum.map(fn user_id ->
        deck = List.first(Hexen.Inventory.get_users_deck_id_as_list(user_id))

        %{
          player: user_id,
          deck: deck,
          hand: draw_cards(deck)
        }
      end)

    full_map = Hexen.Map.get_full_board()

    # band_info =
    #   raw_hex
    #   |> Map.get(:band_id)
    #   |> Hexen.People.get_band!()
    #   |> Map.take([:id, :name, :sigil])

    %{
      hex_tiles: full_map,
      tile: tile_info,
      players: player_info
      # band: band_info
    }
  end

  defp update_state(new_state, existing_state) do
    Map.merge(existing_state, new_state)
  end

  defp schedule_hex_fetch do
    Process.send_after(self(), :hex_fetch, 10_000)
  end

  defp broadcast(updated_state, response, message) do
    HexenWeb.Endpoint.broadcast(
      "hex:#{updated_state[:id]}",
      message,
      Map.merge(updated_state, %{response: response})
    )
  end

  defp via_tuple(room_name) do
    {:via, :gproc, {:n, :l, {:chat_room, room_name}}}
  end
end
