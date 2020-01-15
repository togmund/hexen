defmodule Hexen.People.User do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string

    belongs_to :band, Hexen.People.Band

    has_many :user_quests, Hexen.Events.UserQuest
    has_many :decks, Hexen.Inventory.Deck
    has_many :hex_users, Hexen.Map.HexUser

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :avatar])
    |> validate_required([:name, :email, :avatar])
  end
end
