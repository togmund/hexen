defmodule Hexen.Events.CardQuest do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "card_quests" do
    field :progress, :integer
    belongs_to :card, Hexen.Inventory.Card
    belongs_to :quest, Hexen.Events.Quest

    timestamps()
  end

  @doc false
  def changeset(card_quest, attrs) do
    card_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
