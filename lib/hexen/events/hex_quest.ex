defmodule Hexen.Events.HexQuest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hex_quests" do
    field :progress, :integer
    belongs_to :hex, Hexen.Map.Hex
    belongs_to :quest, Hexen.Events.Quest

    timestamps()
  end

  @doc false
  def changeset(hex_quest, attrs) do
    hex_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
