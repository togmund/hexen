defmodule HexenWeb.PageController do
  use HexenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
