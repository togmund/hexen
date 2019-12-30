defmodule Hexen.Inventory.DeckCard do
  use Ecto.Schema
  import Ecto.Changeset


  schema "deck_cards" do
    field :deck_id, :id
    field :card_id, :id

    timestamps()
  end

  @doc false
  def changeset(deck_card, attrs) do
    deck_card
    |> cast(attrs, [])
    |> validate_required([])
  end
end
