defmodule Hexen.Inventory.Deck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "decks" do
    field :cardback, :string
    field :name, :string

    belongs_to :user, Hexen.People.User

    has_many :deck_cards, Hexen.Inventory.DeckCard

    timestamps()
  end

  @doc false
  def changeset(deck, attrs) do
    deck
    |> cast(attrs, [:name, :cardback])
    |> validate_required([:name, :cardback])
  end
end
