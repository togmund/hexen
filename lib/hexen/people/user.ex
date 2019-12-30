defmodule Hexen.People.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :band_id, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :avatar, :email])
    |> validate_required([:name, :avatar, :email])
    |> unique_constraint(:name)
    |> unique_constraint(:email)
  end
end
