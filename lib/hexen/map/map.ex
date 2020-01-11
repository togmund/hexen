defmodule Hexen.Map do
  @moduledoc """
  The Map context.
  """

  import Ecto.Query, warn: false
  alias Hexen.Map.Biome
  alias Hexen.Map.Hex
  alias Hexen.Map.HexUser
  alias Hexen.Map.Region
  alias Hexen.Repo

  @doc """
  Returns the list of regions.

  ## Examples

      iex> list_regions()
      [%Region{}, ...]

  """
  def list_regions do
    Repo.all(Region)
  end

  @doc """
  Gets a single region.

  Raises `Ecto.NoResultsError` if the Region does not exist.

  ## Examples

      iex> get_region!(123)
      %Region{}

      iex> get_region!(456)
      ** (Ecto.NoResultsError)

  """
  def get_region!(id), do: Repo.get!(Region, id)

  @doc """
  Creates a region.

  ## Examples

      iex> create_region(%{field: value})
      {:ok, %Region{}}

      iex> create_region(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_region(attrs \\ %{}) do
    %Region{}
    |> Region.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a region.

  ## Examples

      iex> update_region(region, %{field: new_value})
      {:ok, %Region{}}

      iex> update_region(region, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_region(%Region{} = region, attrs) do
    region
    |> Region.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Region.

  ## Examples

      iex> delete_region(region)
      {:ok, %Region{}}

      iex> delete_region(region)
      {:error, %Ecto.Changeset{}}

  """
  def delete_region(%Region{} = region) do
    Repo.delete(region)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking region changes.

  ## Examples

      iex> change_region(region)
      %Ecto.Changeset{source: %Region{}}

  """
  def change_region(%Region{} = region) do
    Region.changeset(region, %{})
  end

  @doc """
  Returns the list of biomes.

  ## Examples

      iex> list_biomes()
      [%Biome{}, ...]

  """
  def list_biomes do
    Repo.all(Biome)
  end

  @doc """
  Gets a single biome.

  Raises `Ecto.NoResultsError` if the Biome does not exist.

  ## Examples

      iex> get_biome!(123)
      %Biome{}

      iex> get_biome!(456)
      ** (Ecto.NoResultsError)

  """
  def get_biome!(id), do: Repo.get!(Biome, id)

  @doc """
  Creates a biome.

  ## Examples

      iex> create_biome(%{field: value})
      {:ok, %Biome{}}

      iex> create_biome(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_biome(attrs \\ %{}) do
    %Biome{}
    |> Biome.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a biome.

  ## Examples

      iex> update_biome(biome, %{field: new_value})
      {:ok, %Biome{}}

      iex> update_biome(biome, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_biome(%Biome{} = biome, attrs) do
    biome
    |> Biome.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Biome.

  ## Examples

      iex> delete_biome(biome)
      {:ok, %Biome{}}

      iex> delete_biome(biome)
      {:error, %Ecto.Changeset{}}

  """
  def delete_biome(%Biome{} = biome) do
    Repo.delete(biome)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking biome changes.

  ## Examples

      iex> change_biome(biome)
      %Ecto.Changeset{source: %Biome{}}

  """
  def change_biome(%Biome{} = biome) do
    Biome.changeset(biome, %{})
  end

  @doc """
  Returns the list of hexes.

  ## Examples

      iex> list_hexes()
      [%Hex{}, ...]

  """
  def list_hexes do
    Repo.all(Hex)
  end

  @doc """
  Gets a single hex.

  Raises `Ecto.NoResultsError` if the Hex does not exist.

  ## Examples

      iex> get_hex!(123)
      %Hex{}

      iex> get_hex!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hex!(id), do: Repo.get!(Hex, id)

  @doc """
  Creates a hex.

  ## Examples

      iex> create_hex(%{field: value})
      {:ok, %Hex{}}

      iex> create_hex(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hex(attrs \\ %{}) do
    %Hex{}
    |> Hex.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hex.

  ## Examples

      iex> update_hex(hex, %{field: new_value})
      {:ok, %Hex{}}

      iex> update_hex(hex, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hex(%Hex{} = hex, attrs) do
    hex
    |> Hex.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hex.

  ## Examples

      iex> delete_hex(hex)
      {:ok, %Hex{}}

      iex> delete_hex(hex)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hex(%Hex{} = hex) do
    Repo.delete(hex)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hex changes.

  ## Examples

      iex> change_hex(hex)
      %Ecto.Changeset{source: %Hex{}}

  """
  def change_hex(%Hex{} = hex) do
    Hex.changeset(hex, %{})
  end

  @doc """
  Returns the list of hex_users.

  ## Examples

      iex> list_hex_users()
      [%HexUser{}, ...]

  """
  def list_hex_users do
    Repo.all(HexUser)
  end

  @doc """
  Gets a single hex_user.

  Raises `Ecto.NoResultsError` if the Hex user does not exist.

  ## Examples

      iex> get_hex_user!(123)
      %HexUser{}

      iex> get_hex_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hex_user!(id), do: Repo.get!(HexUser, id)

  @doc """
  Creates a hex_user.

  ## Examples

      iex> create_hex_user(%{field: value})
      {:ok, %HexUser{}}

      iex> create_hex_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hex_user(attrs \\ %{}) do
    %HexUser{}
    |> HexUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hex_user.

  ## Examples

      iex> update_hex_user(hex_user, %{field: new_value})
      {:ok, %HexUser{}}

      iex> update_hex_user(hex_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hex_user(%HexUser{} = hex_user, attrs) do
    hex_user
    |> HexUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HexUser.

  ## Examples

      iex> delete_hex_user(hex_user)
      {:ok, %HexUser{}}

      iex> delete_hex_user(hex_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hex_user(%HexUser{} = hex_user) do
    Repo.delete(hex_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hex_user changes.

  ## Examples

      iex> change_hex_user(hex_user)
      %Ecto.Changeset{source: %HexUser{}}

  """
  def change_hex_user(%HexUser{} = hex_user) do
    HexUser.changeset(hex_user, %{})
  end

  ################################################################
  ######################## Custom queries ########################
  ################################################################

  @doc """
  Returns the list of hexes.

  ## Examples

      iex> list_hexes()
      [%Hex{}, ...]

  """
  def list_hex_ids do
    Repo.all(
      from h in Hex,
        select: h.id
    )
  end

  @doc """
  Returns the list of hex_users.

  ## Examples

      iex> list_hex_users()
      [%HexUser{}, ...]

  """
  def list_hex_user_ids_by_hex(hex_id) do
    Repo.all(
      from hu in HexUser,
        where: hu.hex_id == ^hex_id,
        select: hu.id
    )
  end

  def get_hex_user_by_user(userID) do
    query =
      from hu in HexUser,
        where: hu.user_id == ^userID and is_nil(hu.departed),
        select: hu

    Repo.one(query)
  end

  def update_player_departure(%HexUser{} = hex_user, departure_time) do
    hex_user
    |> Ecto.Changeset.change(%{departed: departure_time})
    |> Hexen.Repo.update()
  end

  @doc """
  Returns the list of hex_users.

  ## Examples

      iex> list_hex_users()
      [%HexUser{}, ...]

  """

  @doc """
  Returns the list of hexes.

  ## Examples

      iex> list_hexes()
      [%Hex{}, ...]

  """
  def list_hex_ids do
    Repo.all(
      from h in Hex,
        select: h.id
    )
  end

  def list_hex_user_ids_by_hex(hex_id) do
    Repo.all(
      from hu in HexUser,
        where: hu.hex_id == ^hex_id,
        select: hu.id
    )
  end

  @doc """
  """
  def get_full_board do
    Repo.all(
      from h in Hex,
        join: r in Region,
        on: r.id == h.region_id,
        join: b in Biome,
        on: b.id == h.biome_id,
        select: %{
          id: h.id,
          name: h.name,
          q: h.q,
          r: h.r,
          s: h.s,
          structure: h.structure,
          region_name: r.name,
          biome_name: b.name,
          resource: h.resource,
          image: b.image
        }
    )
  end

  @doc """
  """
  def get_single_tile(id) do
    Repo.all(
      from h in Hex,
        join: r in Region,
        on: r.id == h.region_id,
        join: b in Biome,
        on: b.id == h.biome_id,
        where: h.id == ^id,
        select: %{
          id: h.id,
          name: h.name,
          q: h.q,
          r: h.r,
          s: h.s,
          structure: h.structure,
          region_name: r.name,
          biome_name: b.name,
          resource: h.resource,
          image: b.image
        }
    )
  end

  def get_active_hex_id_for_user(id) do
    Repo.all(
      from hu in HexUser,
        where: hu.user_id == ^id and is_nil(hu.departed),
        select: hu.hex_id
    )
    |> List.first()
  end
end
