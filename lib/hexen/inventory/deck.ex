defmodule Hexen.Inventory.Deck do
  use Ecto.Schema
  import Ecto.Changeset


  schema "decks" do
    field :cardback, :string
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(deck, attrs) do
    deck
    |> cast(attrs, [:name, :cardback])
    |> validate_required([:name, :cardback])
  end
end
