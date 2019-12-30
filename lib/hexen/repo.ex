defmodule Hexen.Repo do
  use Ecto.Repo,
    otp_app: :hexen,
    adapter: Ecto.Adapters.Postgres
end
