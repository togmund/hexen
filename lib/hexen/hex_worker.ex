defmodule Hexen.HexWorker do
  use GenServer

  def start_link(args) do
    IO.inspect(args)
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
      |> tile_data()
      |> update_state(state)

    # if updated_state != state do
    broadcast_hex_state(updated_state, :ok)
    broadcast_card_request(updated_state, :ok)
    # end
    deck_id = 1
    # We wana use Deck ID here and map over all users/decks in the server
    draw_cards(deck_id)
    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  # def add_card(room_name, message) do
  #   # And the `GenServer` callbacks will accept this tuple the same way it
  #   # accepts a `pid` or an atom.
  #   GenServer.cast(via_tuple(room_name), {:add_card, message})

  # end

  def get_action(message) do
    # DeckCard ID for the card selected
    elem(message, 1)
    |> Hexen.Inventory.get_card_id_by_deck_card!()
    |> List.first()
    |> Hexen.Inventory.get_card!()
    |> Map.take([:suit, :modifier])
  end

  def perform_action(room_name, message) do
    action = get_action(message)
    suit = action[:suit]
    modifier = action[:modifier]

    case suit do
      "Combat" -> combat(modifier)
      "Move" -> move(modifier)
      "Gather" -> gather(modifier)
      "Explore" -> explore(modifier)
      "Interact" -> interact(modifier)
      "Craft" -> craft(modifier)
    end
  end

  def combat(modifier) do
    # TO DO
    IO.puts("You selected a combat card!")
  end

  def move(modifier) do
    # TO DO
    IO.puts("You selected a movement card!")
  end

  def gather(modifier) do
    # TO DO
    IO.puts("You selected a gather card!")
  end

  def explore(modifier) do
    # TO DO
    IO.puts("You selected an exploration card!")
  end

  def interact(modifier) do
    # TO DO
    IO.puts("You selected a interaction card!")
  end

  def craft(modifier) do
    # TO DO
    IO.puts("You selected a crafting card!")
  end

  def move(modifier) do
    # TO DO
    IO.puts("You selected a movement card!")
  end

  def gather(modifier) do
    # TO DO
    IO.puts("You selected a gather card!")
  end

  def explore(modifier) do
    # TO DO
    IO.puts("You selected an exploration card!")
  end

  def interact(modifier) do
    # TO DO
    IO.puts("You selected a interaction card!")
  end

  def craft(modifier) do
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
        # Some kind of front end shuffle turn
        IO.puts("Not Enough Cards, time to re-shuffle!")
        # Mark all deckcards as undrawn
        Hexen.Inventory.shuffle_discard_into_deck(deck_id)

      length(drawn_cards) == 3 ->
        # Send those 3 to the front end
        new_hand =
          drawn_cards
          # |> Enum.map(fn deck_card_id ->
          #   %{
          #     deck_card_id: deck_card_id,
          #     card_details: Hexen.Inventory.get_card!()
          #   }
          # end)
          |> IO.inspect()

        # Then mark them each as drawn
        drawn_cards
        |> Enum.each(fn hand_card_id ->
          Hexen.Inventory.update_drawn_status(Hexen.Inventory.get_deck_card!(hand_card_id), true)
        end)
    end
  end

  defp tile_data(id) do
    id
    |> Hexen.Map.get_hex!()
    |> Map.take([:id, :name, :region_id, :resource, :structure])
    |> Map.merge(%{})
  end

  defp update_state(new_state, existing_state) do
    Map.merge(existing_state, new_state)
  end

  defp schedule_hex_fetch do
    Process.send_after(self(), :hex_fetch, 10_000)
  end

  defp broadcast_hex_state(updated_state, response) do
    HexenWeb.Endpoint.broadcast(
      "hex:#{updated_state[:id]}",
      "hex_state",
      %{
        response: response,
        id: updated_state[:id],
        name: updated_state[:name],
        region: updated_state[:region_id],
        resource: updated_state[:resource],
        structure: updated_state[:structure]
      }
    )
  end

  defp broadcast_card_request(updated_state, response) do
    HexenWeb.Endpoint.broadcast(
      "hex:#{updated_state[:id]}",
      "select_card",
      %{
        response: response
      }
    )
  end

  defp broadcast_new_hand(new_hand, updated_state, response) do
    HexenWeb.Endpoint.broadcast(
      "hex:#{updated_state[:id]}",
      "new_hand",
      Map.merge(%{response: response}, new_hand)
    )
  end

  defp via_tuple(room_name) do
    {:via, :gproc, {:n, :l, {:chat_room, room_name}}}
  end
end
