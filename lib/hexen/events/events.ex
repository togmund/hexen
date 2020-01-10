defmodule Hexen.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Hexen.Repo

  alias Hexen.Events.Quest

  @doc """
  Returns the list of quests.

  ## Examples

      iex> list_quests()
      [%Quest{}, ...]

  """
  def list_quests do
    Repo.all(Quest)
  end

  @doc """
  Gets a single quest.

  Raises `Ecto.NoResultsError` if the Quest does not exist.

  ## Examples

      iex> get_quest!(123)
      %Quest{}

      iex> get_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quest!(id), do: Repo.get!(Quest, id)

  @doc """
  Creates a quest.

  ## Examples

      iex> create_quest(%{field: value})
      {:ok, %Quest{}}

      iex> create_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quest(attrs \\ %{}) do
    %Quest{}
    |> Quest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quest.

  ## Examples

      iex> update_quest(quest, %{field: new_value})
      {:ok, %Quest{}}

      iex> update_quest(quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quest(%Quest{} = quest, attrs) do
    quest
    |> Quest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Quest.

  ## Examples

      iex> delete_quest(quest)
      {:ok, %Quest{}}

      iex> delete_quest(quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quest(%Quest{} = quest) do
    Repo.delete(quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quest changes.

  ## Examples

      iex> change_quest(quest)
      %Ecto.Changeset{source: %Quest{}}

  """
  def change_quest(%Quest{} = quest) do
    Quest.changeset(quest, %{})
  end

  alias Hexen.Events.UserQuest

  @doc """
  Returns the list of user_quests.

  ## Examples

      iex> list_user_quests()
      [%UserQuest{}, ...]

  """
  def list_user_quests do
    Repo.all(UserQuest)
  end

  @doc """
  Gets a single user_quest.

  Raises `Ecto.NoResultsError` if the User quest does not exist.

  ## Examples

      iex> get_user_quest!(123)
      %UserQuest{}

      iex> get_user_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_quest!(id), do: Repo.get!(UserQuest, id)

  @doc """
  Creates a user_quest.

  ## Examples

      iex> create_user_quest(%{field: value})
      {:ok, %UserQuest{}}

      iex> create_user_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_quest(attrs \\ %{}) do
    %UserQuest{}
    |> UserQuest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_quest.

  ## Examples

      iex> update_user_quest(user_quest, %{field: new_value})
      {:ok, %UserQuest{}}

      iex> update_user_quest(user_quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_quest(%UserQuest{} = user_quest, attrs) do
    user_quest
    |> UserQuest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserQuest.

  ## Examples

      iex> delete_user_quest(user_quest)
      {:ok, %UserQuest{}}

      iex> delete_user_quest(user_quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_quest(%UserQuest{} = user_quest) do
    Repo.delete(user_quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_quest changes.

  ## Examples

      iex> change_user_quest(user_quest)
      %Ecto.Changeset{source: %UserQuest{}}

  """
  def change_user_quest(%UserQuest{} = user_quest) do
    UserQuest.changeset(user_quest, %{})
  end

  alias Hexen.Events.CardQuest

  @doc """
  Returns the list of card_quests.

  ## Examples

      iex> list_card_quests()
      [%CardQuest{}, ...]

  """
  def list_card_quests do
    Repo.all(CardQuest)
  end

  @doc """
  Gets a single card_quest.

  Raises `Ecto.NoResultsError` if the Card quest does not exist.

  ## Examples

      iex> get_card_quest!(123)
      %CardQuest{}

      iex> get_card_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card_quest!(id), do: Repo.get!(CardQuest, id)

  @doc """
  Creates a card_quest.

  ## Examples

      iex> create_card_quest(%{field: value})
      {:ok, %CardQuest{}}

      iex> create_card_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card_quest(attrs \\ %{}) do
    %CardQuest{}
    |> CardQuest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card_quest.

  ## Examples

      iex> update_card_quest(card_quest, %{field: new_value})
      {:ok, %CardQuest{}}

      iex> update_card_quest(card_quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card_quest(%CardQuest{} = card_quest, attrs) do
    card_quest
    |> CardQuest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CardQuest.

  ## Examples

      iex> delete_card_quest(card_quest)
      {:ok, %CardQuest{}}

      iex> delete_card_quest(card_quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card_quest(%CardQuest{} = card_quest) do
    Repo.delete(card_quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card_quest changes.

  ## Examples

      iex> change_card_quest(card_quest)
      %Ecto.Changeset{source: %CardQuest{}}

  """
  def change_card_quest(%CardQuest{} = card_quest) do
    CardQuest.changeset(card_quest, %{})
  end

  alias Hexen.Events.BandQuest

  @doc """
  Returns the list of band_quests.

  ## Examples

      iex> list_band_quests()
      [%BandQuest{}, ...]

  """
  def list_band_quests do
    Repo.all(BandQuest)
  end

  @doc """
  Gets a single band_quest.

  Raises `Ecto.NoResultsError` if the Band quest does not exist.

  ## Examples

      iex> get_band_quest!(123)
      %BandQuest{}

      iex> get_band_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_band_quest!(id), do: Repo.get!(BandQuest, id)

  @doc """
  Creates a band_quest.

  ## Examples

      iex> create_band_quest(%{field: value})
      {:ok, %BandQuest{}}

      iex> create_band_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_band_quest(attrs \\ %{}) do
    %BandQuest{}
    |> BandQuest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a band_quest.

  ## Examples

      iex> update_band_quest(band_quest, %{field: new_value})
      {:ok, %BandQuest{}}

      iex> update_band_quest(band_quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_band_quest(%BandQuest{} = band_quest, attrs) do
    band_quest
    |> BandQuest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BandQuest.

  ## Examples

      iex> delete_band_quest(band_quest)
      {:ok, %BandQuest{}}

      iex> delete_band_quest(band_quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_band_quest(%BandQuest{} = band_quest) do
    Repo.delete(band_quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking band_quest changes.

  ## Examples

      iex> change_band_quest(band_quest)
      %Ecto.Changeset{source: %BandQuest{}}

  """
  def change_band_quest(%BandQuest{} = band_quest) do
    BandQuest.changeset(band_quest, %{})
  end

  alias Hexen.Events.HexQuest

  @doc """
  Returns the list of hex_quests.

  ## Examples

      iex> list_hex_quests()
      [%HexQuest{}, ...]

  """
  def list_hex_quests do
    Repo.all(HexQuest)
  end

  @doc """
  Gets a single hex_quest.

  Raises `Ecto.NoResultsError` if the Hex quest does not exist.

  ## Examples

      iex> get_hex_quest!(123)
      %HexQuest{}

      iex> get_hex_quest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hex_quest!(id), do: Repo.get!(HexQuest, id)

  @doc """
  Creates a hex_quest.

  ## Examples

      iex> create_hex_quest(%{field: value})
      {:ok, %HexQuest{}}

      iex> create_hex_quest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hex_quest(attrs \\ %{}) do
    %HexQuest{}
    |> HexQuest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hex_quest.

  ## Examples

      iex> update_hex_quest(hex_quest, %{field: new_value})
      {:ok, %HexQuest{}}

      iex> update_hex_quest(hex_quest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hex_quest(%HexQuest{} = hex_quest, attrs) do
    hex_quest
    |> HexQuest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HexQuest.

  ## Examples

      iex> delete_hex_quest(hex_quest)
      {:ok, %HexQuest{}}

      iex> delete_hex_quest(hex_quest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hex_quest(%HexQuest{} = hex_quest) do
    Repo.delete(hex_quest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hex_quest changes.

  ## Examples

      iex> change_hex_quest(hex_quest)
      %Ecto.Changeset{source: %HexQuest{}}

  """
  def change_hex_quest(%HexQuest{} = hex_quest) do
    HexQuest.changeset(hex_quest, %{})
  end

  ################################################################
  ######################## Custom queries ########################
  ################################################################
end
