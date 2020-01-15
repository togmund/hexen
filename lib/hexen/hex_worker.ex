defmodule Hexen.HexWorker do
  @moduledoc """
    Module Documentation
  """
  use GenServer

  def start_link(args) do
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

    broadcast(updated_state, :ok, "GET_CARD")
    broadcast(updated_state, :ok, "SET_BOARD")

    broadcast(updated_state, :ok, "SET_HEX")
    broadcast(updated_state, :ok, "SET_HAND")
    broadcast(updated_state, :ok, "SET_QUESTS")

    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  def get_action(deck_card_id) do
    # DeckCard ID for the card selected

    case deck_card_id do
      nil ->
        nil

      _ ->
        card_id =
          deck_card_id
          |> Hexen.Inventory.get_card_id_by_deck_card()
          |> List.first()

        case card_id do
          nil ->
            nil

          _ ->
            card_id
            |> Hexen.Inventory.get_card!()
            |> Map.take([:suit, :modifier])
        end
    end
  end

  def perform_action(_room_name, deck_card_id, user_id, target_hex_id, target_user_id, tile_id) do
    action = get_action(deck_card_id)
    suit = action[:suit]
    modifier = action[:modifier]

    case suit do
      "Combat" ->
        combat(modifier, user_id, target_hex_id, target_user_id, tile_id)

      "Move" ->
        move(modifier, user_id, target_hex_id, tile_id)

      "Gather" ->
        gather(modifier, user_id, target_hex_id, tile_id)

      "Explore" ->
        explore(modifier, user_id, deck_card_id, tile_id)

      "Interact" ->
        interact(modifier, user_id, target_hex_id, target_user_id, tile_id)

      "Craft" ->
        craft(modifier, user_id, target_hex_id, tile_id)

      _ ->
        nil
    end
  end

  def combat(_modifier, user_id, _target_hex_id, _target_user_id, tile_id) do
    # Challenges a local player to a duel

    # if Enum.random(1..3) == 3 do
    new_card =
      Hexen.Inventory.get_card_ids_by_suit_list(["Explore"])
      |> Enum.random()

    deck_id =
      Hexen.Inventory.get_users_deck_id_as_list(user_id)
      |> List.first()

    %{deck_id: deck_id, card_id: new_card}
    |> Hexen.Inventory.create_deck_card!()

    tile_id
    |> retrieve_state()
    |> update_state(%{id: tile_id})

    # end
  end

  def move(_modifier, user_id, target_hex_id, _tile_id) do
    hex_user =
      user_id
      |> Hexen.Map.get_hex_user_id_by_user()

    %{hex_id: target_hex_id, user_id: user_id, departed: nil}
    |> Hexen.Map.create_hex_user()

    hex_user
    |> Hexen.Map.update_player_departure(NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second))
  end

  def gather(_modifier, user_id, _target_hex_id, tile_id) do
    # Gathers the active resource
    resource =
      Hexen.Map.get_active_hex_id_for_user(user_id)
      |> Hexen.Map.get_resource_by_hex_id()

    # Take one of the possible cards to craft
    card_id =
      Hexen.Inventory.get_card_ids_by_suit_list_and_resource(["Craft"], resource)
      |> Enum.random()

    # Add to current_deck's deck_card
    deck_id = Hexen.Inventory.get_users_deck_id_as_list(user_id) |> List.first()

    Hexen.Inventory.create_deck_card!(%{deck_id: deck_id, card_id: card_id})

    # state =
    tile_id
    |> retrieve_state()
    |> update_state(%{id: tile_id})

    # broadcast(state, :ok, "DISCONNECT")
  end

  def explore(_modifier, user_id, deck_card_id, tile_id) do
    # TO DO
    # Highlights a Tile with a Quest
    new_quest =
      user_id
      |> Hexen.Events.get_existing_quest_list_by_user()
      |> Hexen.Events.get_novel_quests()
      |> Enum.random()
      |> Map.get(:id)

    %{quest_id: new_quest, user_id: user_id, progress: 0}
    |> Hexen.Events.create_user_quest()

    [deck_card_id]
    |> Hexen.Inventory.delete_deck_cards()

    tile_id
    |> retrieve_state()
    |> update_state(%{id: tile_id})
  end

  def interact(_modifier, user_id, _target_hex_id, _target_user_id, tile_id) do
    # if Enum.random(1..3) == 3 do
    new_card =
      Hexen.Inventory.get_card_ids_by_suit_list(["Explore"])
      |> Enum.random()

    deck_id =
      Hexen.Inventory.get_users_deck_id_as_list(user_id)
      |> List.first()

    %{deck_id: deck_id, card_id: new_card}
    |> Hexen.Inventory.create_deck_card!()

    tile_id
    |> retrieve_state()
    |> update_state(%{id: tile_id})

    # end
  end

  def craft(_modifier, user_id, _target_hex_id, tile_id) do
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
          |> Enum.random()

        Hexen.Inventory.create_deck_card!(%{deck_id: deck_id, card_id: card_id})

        tile_id
        |> retrieve_state()
        |> update_state(%{id: tile_id})

      length(consumable_cards) == 2 ->
        card_id =
          Hexen.Inventory.get_card_ids_by_suit_list(["Gather", "Move"])
          |> Enum.random()

        Hexen.Inventory.create_deck_card!(%{deck_id: deck_id, card_id: card_id})

        consumable_cards
        |> Enum.shuffle()
        |> Enum.slice(0..1)
        |> Hexen.Inventory.delete_deck_cards()

        tile_id
        |> retrieve_state()
        |> update_state(%{id: tile_id})

      length(consumable_cards) > 2 ->
        card_id =
          Hexen.Inventory.get_card_ids_by_suit_list(["Gather", "Move", "Combat"])
          |> Enum.random()

        Hexen.Inventory.create_deck_card!(%{deck_id: deck_id, card_id: card_id})

        consumable_cards
        |> Enum.shuffle()
        |> Enum.slice(0..2)
        |> Hexen.Inventory.delete_deck_cards()

        tile_id
        |> retrieve_state()
        |> update_state(%{id: tile_id})
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
    full_map = Hexen.Map.get_full_board()

    player_info =
      id
      |> Hexen.Map.list_hex_user_ids_by_hex()
      |> Enum.map(fn user_id ->
        deck =
          user_id
          |> Hexen.Inventory.get_users_deck_id_as_list()
          |> List.first()

        new_hand =
          deck
          |> draw_cards()

        active_quest_hexes =
          user_id
          |> Hexen.Events.get_hexes_with_active_quests_for_user()

        user =
          user_id
          |> Hexen.People.get_user!()

        %{
          player: user_id,
          name: user.name,
          avatar: user.avatar,
          deck: deck,
          hand: new_hand,
          active_quest_hexes: active_quest_hexes
        }
      end)

    tile_info =
      id
      |> Hexen.Map.get_single_tile()
      |> List.first()
      |> Map.merge(%{hex_players: player_info})

    user_object =
      player_info
      |> Enum.map(fn player -> {player[:player], player} end)
      |> Map.new()

    %{
      hex_tiles: full_map,
      tile: tile_info,
      # tile: Map.merge(tile_info, %{hex_players: player_info}),
      players: user_object
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
