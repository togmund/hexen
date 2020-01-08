defmodule HexenWeb.Router do
  use HexenWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_user_id
    plug :put_token
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/api", HexenWeb do
    pipe_through :api

    resources "/languages", LanguageController, except: [:new, :edit]
  end

  scope "/", HexenWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HexenWeb do
  #   pipe_through :api
  # end

  defp put_user_id(conn, _headers) do
    %{id: id} =
      conn
      |> Pow.Plug.current_user()

    assign(conn, :user_id, id)
  end

  defp put_token(conn, _headers) do
    id = conn.assigns.user_id
    first_token = Phoenix.Token.sign(HexenWeb.Endpoint, "salt", id)
    assign(conn, :token, first_token)
  end
end
