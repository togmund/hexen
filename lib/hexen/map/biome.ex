defmodule Hexen.Map.Biome do
  @moduledoc """
    Module Documentation
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "biomes" do
    field :name, :string
    field :resource, :string
    field :image, :string

    has_many :hexes, Hexen.Map.Hex

    timestamps()
  end

  @doc false
  def changeset(biome, attrs) do
    biome
    |> cast(attrs, [:name, :resource, :image])
    |> validate_required([:name, :resource, :image])
    |> unique_constraint(:name)
  end
end
