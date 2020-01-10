defmodule Hexen.Events.BandQuest do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "band_quests" do
    field :progress, :integer
    belongs_to :band, Hexen.People.Band
    belongs_to :quest, Hexen.Events.Quest

    timestamps()
  end

  @doc false
  def changeset(band_quest, attrs) do
    band_quest
    |> cast(attrs, [:progress])
    |> validate_required([:progress])
  end
end
