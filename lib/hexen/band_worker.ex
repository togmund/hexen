defmodule Hexen.BandWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    schedule_band_fetch()
    {:ok, state}
  end

  def handle_info(:band_fetch, state) do
    updated_state =
      state
        |> Map.get(:id)
        |> band_data()
        |> Map.take([:id, :name, :sigil])
        |> update_state(state)

    if updated_state != state do
      IO.inspect("Update state: #{updated_state}")
    end

    {:noreply, updated_state}
  end

  defp band_data(id) do
    id
      |> Hexen.People.get_band!()
  end

  defp update_state(new_state, existing_state) do
    Map.merge(existing_state, new_state)
  end

  defp schedule_band_fetch do
    Process.send_after(self(), :band_fetch, 5_000)
  end
end
