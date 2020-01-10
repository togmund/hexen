defmodule Hexen.Repo do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Repo,
    otp_app: :hexen,
    adapter: Ecto.Adapters.Postgres
end
