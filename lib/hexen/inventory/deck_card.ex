defmodule Hexen.Inventory.DeckCard do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "deck_cards" do
    belongs_to :card, Hexen.Inventory.Card
    belongs_to :deck, Hexen.Inventory.Deck
    field :drawn, :boolean, default: false, null: false

    timestamps()
  end

  @doc false
  def changeset(deck_card, attrs) do
    deck_card
    |> cast(attrs, [:card_id, :deck_id])
    |> validate_required([:card_id, :deck_id])
  end
end
