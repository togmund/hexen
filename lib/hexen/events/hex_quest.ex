defmodule Hexen.Events.HexQuest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hex_quests" do
    field :progress, :integer
    field :hex_id, :id
    field :quest_id, :id

    timestamps()
  end

  @doc false
  def changeset(hex_quest, attrs) do
    hex_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
