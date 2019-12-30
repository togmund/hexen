defmodule Hexen.Map.Biome do
  use Ecto.Schema
  import Ecto.Changeset


  schema "biomes" do
    field :name, :string
    field :resource, :string

    timestamps()
  end

  @doc false
  def changeset(biome, attrs) do
    biome
    |> cast(attrs, [:name, :resource])
    |> validate_required([:name, :resource])
    |> unique_constraint(:name)
  end
end
