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
    # IO.puts("""

    # Hex Data for ID:#{updated_state[:id]}
    # Name:#{updated_state[:name]}
    # Region:#{updated_state[:region_id]}
    # Resource:#{updated_state[:resource]}
    # Structure:#{updated_state[:structure]}
    # """)

    # end
    # We wana use Deck ID here and map over all users/decks in the server
    draw_cards(1)
    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  # def add_card(room_name, message) do
  #   # And the `GenServer` callbacks will accept this tuple the same way it
  #   # accepts a `pid` or an atom.
  #   GenServer.cast(via_tuple(room_name), {:add_card, message})

  # end

  def perform_action(room_name, message) do
    # Execute card action
    Hexen.Inventory.get_deck_card!(elem(message, 1))
  end

  def draw_cards(deck_id) do
    # Randomly select 3 valid deck cards
    # TO DO

    # Query Undrawn cards
    # Choose 3
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
        Hexen.Inventory.shuffle_discard_into_deck(1)

      length(drawn_cards) == 3 ->
        drawn_cards
        # Send those 3 to the front end
        |> IO.inspect()
        # Then mark them each as drawn
        |> Enum.each(fn hand_card_id ->
          Hexen.Inventory.update_drawn_status(Hexen.Inventory.get_deck_card!(hand_card_id), true)
        end)
    end

    # |> choose_three()

    # Send those 3 to the front end
    # drawn_cards
    # |> broadcast_cards_to_users

    # drawn_cards
    # |> Hexen.Inventory.update_drawn_status(true)
  end

  # Draw 3 cards
  #

  # def handle_info(:add_card, message) do
  #   # IO.puts("############################################")
  #   IO.inspect(message)
  #   # IO.puts("############################################")
  # end

  defp tile_data(id) do
    id
    |> Hexen.Map.get_hex!()
    |> Map.take([:id, :name, :region_id, :resource, :structure])
  end

  defp update_state(
         new_state,
         existing_state
       ) do
    Map.merge(
      existing_state,
      new_state
    )
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

  defp via_tuple(room_name) do
    {:via, :gproc, {:n, :l, {:chat_room, room_name}}}
  end
end
