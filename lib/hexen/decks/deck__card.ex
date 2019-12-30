defmodule Hexen.Decks.Deck_Card do
  use Ecto.Schema
  import Ecto.Changeset


  schema "deck_cards" do
    field :deck_id, :id
    field :card_id, :id

    timestamps()
  end

  @doc false
  def changeset(deck__card, attrs) do
    deck__card
    |> cast(attrs, [])
    |> validate_required([])
  end
end
