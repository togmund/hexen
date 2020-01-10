defmodule HexenWeb.MapController do
  use HexenWeb, :controller

  alias Hexen.Map

  def show(conn, %{"id" => id}) do
    initial_state = %{
      hex_tiles: Hexen.Map.get_full_board(),
      tile: %{id: Hexen.Map.get_active_hex_id_for_user(id)}
    }

    render(conn, "show.json", initial_state: initial_state)
  end
end
