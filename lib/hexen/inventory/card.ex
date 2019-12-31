defmodule Hexen.Inventory.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :description, :string
    field :image, :string
    field :modifier, :integer
    field :name, :string
    field :suit, :string

    has_many :quests, Hexen.Events.Quest
    has_many :card_quests, Hexen.Events.CardQuest
    has_many :deck_cards, Hexen.Inventory.DeckCard

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:name, :description, :suit, :modifier, :image])
    |> validate_required([:name, :description, :suit, :modifier, :image])
    |> unique_constraint(:name)
  end
end
