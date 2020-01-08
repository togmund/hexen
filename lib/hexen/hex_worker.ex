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

    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  def add_card(room_name, message) do
    # And the `GenServer` callbacks will accept this tuple the same way it
    # accepts a `pid` or an atom.
    GenServer.cast(via_tuple(room_name), {:add_card, message})
    Hexen.Inventory.get_deck_card!(3)
    |> Hexen.Inventory.update_drawn_status(true)

    IO.puts("############################################")
    IO.inspect(message)
    IO.puts("############################################")
  end

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
