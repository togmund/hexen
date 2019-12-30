defmodule Hexen.Map.Hex do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hexes" do
    field :name, :string
    field :resource, :string
    field :structure, :string
    field :region_id, :id
    field :biome_id, :id
    field :controlled_by, :id

    timestamps()
  end

  @doc false
  def changeset(hex, attrs) do
    hex
    |> cast(attrs, [:name, :structure, :resource])
    |> validate_required([:name, :structure, :resource])
    |> unique_constraint(:name)
  end
end
