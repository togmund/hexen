defmodule Hexen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Hexen.Repo,
      # Start the endpoint when the application starts
      HexenWeb.Endpoint,
      # Starts a worker by calling: Hexen.Worker.start_link(arg)
      # {Hexen.Worker, arg},
      {Hexen.BandWorker, %{}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    hexen_opts = [strategy: :one_for_one, name: Hexen.Supervisor]
    Supervisor.start_link(children, hexen_opts)
    hex_board_opts = [strategy: :one_for_one, name: Hexen.BoardSupervisor]
    Supervisor.start_link(get_hexes(), hex_board_opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HexenWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp get_hexes do
    Enum.map(Hexen.Map.list_hex_ids(), fn id ->
      Supervisor.child_spec({Hexen.HexWorker, %{id: id}}, id: id)
    end)
  end
end
