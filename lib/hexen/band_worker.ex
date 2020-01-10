defmodule Hexen.BandWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
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
      |> update_state(state)

    if updated_state != state do
      # IO.puts("""
      # Band Data for ID:#{updated_state[:id]}
      # Name:#{updated_state[:name]}
      # Sigil:#{updated_state[:sigil]}
      # """)
    end

    schedule_band_fetch()
    {:noreply, updated_state}
  end

  defp band_data(id) do
    id
    |> Hexen.People.get_band!()
    |> Map.take([:id, :name, :sigil])
  end

  defp update_state(new_state, existing_state) do
    Map.merge(existing_state, new_state)
  end

  defp schedule_band_fetch do
    Process.send_after(self(), :band_fetch, 30_000)
  end
end
