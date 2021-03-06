defmodule Hexen.People.Band do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "bands" do
    field :name, :string
    field :sigil, :string

    has_many :users, Hexen.People.User
    has_many :band_quests, Hexen.Events.BandQuest

    timestamps()
  end

  @doc false
  def changeset(band, attrs) do
    band
    |> cast(attrs, [:name, :sigil])
    |> validate_required([:name, :sigil])
    |> unique_constraint(:name)
  end
end
