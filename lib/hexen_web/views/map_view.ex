defmodule HexenWeb.MapView do
  use HexenWeb, :view

  def render("show.json", %{initial_state: initial_state}) do
    initial_state
    |> render_one(__MODULE__, "initial_state.json")
  end

  def render("initial_state.json", %{initial_state: initial_state}) do
    %{data: initial_state}
  end
end
