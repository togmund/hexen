defmodule Hexen.Events.CardQuest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "card_quests" do
    field :progress, :integer
    field :card_id, :id
    field :quest_id, :id

    timestamps()
  end

  @doc false
  def changeset(card_quest, attrs) do
    card_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
