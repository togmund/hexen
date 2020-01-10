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
    schedule_hex_fetch()
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
    # broadcast(updated_state, :ok, "select_card")

    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  def get_action(deck_card_id) do
    # DeckCard ID for the card selected
    deck_card_id
    |> Hexen.Inventory.get_card_id_by_deck_card!()
    |> List.first()
    |> Hexen.Inventory.get_card!()
    |> Map.take([:suit, :modifier])
  end

  def perform_action(room_name, deck_card_id, user_id, target_hex_id) do
    action = get_action(deck_card_id)
    suit = action[:suit]
    modifier = action[:modifier]

    case suit do
      "Combat" -> combat(modifier, target_hex_id)
      "Move" -> move(modifier, user_id, target_hex_id)
      "Gather" -> gather(modifier, target_hex_id)
      "Explore" -> explore(modifier, target_hex_id)
      "Interact" -> interact(modifier, target_hex_id)
      "Craft" -> craft(modifier, target_hex_id)
    end
  end

  def combat(modifier, target_hex_id) do
    # TO DO
    IO.puts("You selected a combat card!")
  end

  def move(modifier, user_id, target_hex_id) do
    # TO DO: Implement modifier
    Hexen.Map.get_hex_user_by_user(user_id)
    |> Hexen.Map.update_player_departure(NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second))

    # TO DO: Move player to new hex
  end

  def gather(modifier, target_hex_id) do
    # TO DO
    IO.puts("You selected a gather card!")
  end

  def explore(modifier, target_hex_id) do
    # TO DO
    IO.puts("You selected an exploration card!")
  end

  def interact(modifier, target_hex_id) do
    # TO DO
    IO.puts("You selected a interaction card!")
  end

  def craft(modifier, target_hex_id) do
    # TO DO
    IO.puts("You selected a crafting card!")
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
        nil

      length(drawn_cards) == 3 ->
        drawn_cards
        |> Enum.each(fn hand_card_id ->
          Hexen.Inventory.update_drawn_status(Hexen.Inventory.get_deck_card!(hand_card_id), true)
        end)

        new_hand =
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

        new_hand
    end
  end

  defp retrieve_state(id) do
    tile_info = Hexen.Map.get_single_tile(id)

    player_info =
      id
      |> Hexen.Map.list_hex_user_ids_by_hex()
      |> Enum.map(fn user_id ->
        deck = List.first(Hexen.Inventory.get_users_deck_id(user_id))

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
