defmodule Hexen.People do
  @moduledoc """
  The People context.
  """

  import Ecto.Query, warn: false
  alias Hexen.Repo

  alias Hexen.People.Band

  @doc """
  Returns the list of bands.

  ## Examples

      iex> list_bands()
      [%Band{}, ...]

  """
  def list_bands do
    Repo.all(Band)
  end

  @doc """
  Returns the list of band IDs.

  ## Examples

      iex> list_band_ids()
      [%Band{}, ...]

  """
  def list_band_ids do
    Repo.all(
      from b in Band,
        select: b.id
    )
  end

  @doc """
  Gets a single band.

  Raises `Ecto.NoResultsError` if the Band does not exist.

  ## Examples

      iex> get_band!(123)
      %Band{}

      iex> get_band!(456)
      ** (Ecto.NoResultsError)

  """
  def get_band!(id), do: Repo.get!(Band, id)

  @doc """
  Creates a band.

  ## Examples

      iex> create_band(%{field: value})
      {:ok, %Band{}}

      iex> create_band(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_band(attrs \\ %{}) do
    %Band{}
    |> Band.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a band.

  ## Examples

      iex> update_band(band, %{field: new_value})
      {:ok, %Band{}}

      iex> update_band(band, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Band.

  ## Examples

      iex> delete_band(band)
      {:ok, %Band{}}

      iex> delete_band(band)
      {:error, %Ecto.Changeset{}}

  """
  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking band changes.

  ## Examples

      iex> change_band(band)
      %Ecto.Changeset{source: %Band{}}

  """
  def change_band(%Band{} = band) do
    Band.changeset(band, %{})
  end

  alias Hexen.Users.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
