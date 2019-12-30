defmodule Hexen.Map.HexUser do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hex_users" do
    field :departed, :naive_datetime
    field :hex_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(hex_user, attrs) do
    hex_user
    |> cast(attrs, [:departed])
    |> validate_required([:departed])
  end
end
