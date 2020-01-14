defmodule Hexen.Map.HexUser do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "hex_users" do
    field :departed, :naive_datetime, default: nil

    belongs_to :hex, Hexen.Map.Hex
    belongs_to :user, Hexen.People.User

    timestamps()
  end

  @doc false
  def changeset(hex_user, attrs) do
    hex_user
    |> cast(attrs, [:hex_id, :user_id, :departed])
  end
end
