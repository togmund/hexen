defmodule Hexen.Events.BandQuest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "band_quests" do
    field :progress, :integer
    field :band_id, :id
    field :quest_id, :id

    timestamps()
  end

  @doc false
  def changeset(band_quest, attrs) do
    band_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
