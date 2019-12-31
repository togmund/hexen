defmodule Hexen.HexWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
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
      |> Map.take([:id, :name, :region_id, :resource, :structure])
      |> IO.inspect()
      |> update_state(state)

    if updated_state != state do
      IO.inspect(updated_state)
    end

    schedule_hex_fetch()

    {:noreply, updated_state}
  end

  defp tile_data(id) do
    id
    |> Hexen.Map.get_hex!()
  end

  defp update_state(_state_state, existing_state) do
    # Map.merge(existing_state, %{
    #   id: id,
    #   name: name
    # })
    existing_state
  end

  defp schedule_hex_fetch do
    Process.send_after(self(), :hex_fetch, 5_000)
  end
end
