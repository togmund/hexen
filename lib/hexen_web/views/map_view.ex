defmodule HexenWeb.MapView do
  use HexenWeb, :view
  alias HexenWeb.MapView

  def render("show.json", %{initial_state: initial_state}) do
    %{
      data: render_one(initial_state, MapView, "initial_state.json", as: :initial_state)
    }
  end

  def render("initial_state.json", %{initial_state: initial_state}) do
    initial_state
    |> Jason.encode!()
    |> Jason.decode!()
  end
end
