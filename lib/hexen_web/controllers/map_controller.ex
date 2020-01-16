defmodule HexenWeb.MapController do
  use HexenWeb, :controller

  alias Hexen.Inventory
  alias Hexen.Events
  alias Hexen.People

  def show(conn, %{"id" => id}) do
    full_map = Hexen.Map.get_full_board()

    deck =
      id
      |> Inventory.get_users_deck_id_as_list()
      |> List.first()

    active_quest_hexes =
      id
      |> Events.get_hexes_with_active_quests_for_user()

    user =
      id
      |> People.get_user!()

    player_info = %{
      id: id,
      name: user.name,
      avatar: user.avatar,
      deck: deck,
      active_quest_hexes: active_quest_hexes
    }

    tile_info =
      id
      |> Hexen.Map.get_active_hex_id_for_user()
      |> Hexen.Map.get_single_tile()
      |> List.first()
      |> Map.merge(%{hex_players: player_info})

    # user_object =
    #   player_info
    #   |> Enum.map(fn player -> {player[:id], player} end)
    #   |> Map.new()

    initial_state = %{
      hex_tiles: full_map,
      tile: tile_info
      # players: user_object
    }

    # initial_state = %{
    #   hex_tiles: Map.get_full_board(),
    #   tile: %{id: Map.get_active_hex_id_for_user(id)}
    # }

    render(conn, "show.json", initial_state: initial_state)
  end
end
