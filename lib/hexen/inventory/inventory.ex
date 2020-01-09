defmodule Hexen.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Hexen.Repo

  alias Hexen.Inventory.Deck
  alias Hexen.Inventory.Card
  alias Hexen.Inventory.DeckCard

  @doc """
  Returns the list of decks.

  ## Examples

      iex> list_decks()
      [%Deck{}, ...]

  """
  def list_decks do
    Repo.all(Deck)
  end

  @doc """
  Gets a single deck.

  Raises `Ecto.NoResultsError` if the Deck does not exist.

  ## Examples

      iex> get_deck!(123)
      %Deck{}

      iex> get_deck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deck!(id), do: Repo.get!(Deck, id)

  def get_users_deck_id(user_id) do
    Repo.all(
      from d in Deck,
        where: d.user_id == ^user_id,
        select: d.id
    )
  end

  @doc """
  Creates a deck.

  ## Examples

      iex> create_deck(%{field: value})
      {:ok, %Deck{}}

      iex> create_deck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deck(attrs \\ %{}) do
    %Deck{}
    |> Deck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deck.

  ## Examples

      iex> update_deck(deck, %{field: new_value})
      {:ok, %Deck{}}

      iex> update_deck(deck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deck(%Deck{} = deck, attrs) do
    deck
    |> Deck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Deck.

  ## Examples

      iex> delete_deck(deck)
      {:ok, %Deck{}}

      iex> delete_deck(deck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deck(%Deck{} = deck) do
    Repo.delete(deck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deck changes.

  ## Examples

      iex> change_deck(deck)
      %Ecto.Changeset{source: %Deck{}}

  """
  def change_deck(%Deck{} = deck) do
    Deck.changeset(deck, %{})
  end

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Card{}, ...]

  """
  def list_cards do
    Repo.all(Card)
  end

  @doc """
  Gets a single card.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

      iex> get_card!(123)
      %Card{}

      iex> get_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card!(id), do: Repo.get!(Card, id)

  @doc """
  Gets the relevant card for a given DeckCard.

  Raises `Ecto.NoResultsError` if the Card does not exist.
  """
  def get_card_id_by_deck_card!(deck_card_id) do
    Repo.all(
      from dc in DeckCard,
        where: dc.id == ^deck_card_id,
        select: dc.card_id
    )
  end

  def card_details_from_card_deck_id(deck_card_id) do
    Repo.all(
      from dc in DeckCard,
        join: c in Card,
        on: c.id == dc.card_id,
        where: dc.id == ^deck_card_id,
        select: c
    )
  end

  @doc """
  Creates a card.

  ## Examples

      iex> create_card(%{field: value})
      {:ok, %Card{}}

      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

      iex> update_card(card, %{field: new_value})
      {:ok, %Card{}}

      iex> update_card(card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Card.

  ## Examples

      iex> delete_card(card)
      {:ok, %Card{}}

      iex> delete_card(card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card(%Card{} = card) do
    Repo.delete(card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card changes.

  ## Examples

      iex> change_card(card)
      %Ecto.Changeset{source: %Card{}}

  """
  def change_card(%Card{} = card) do
    Card.changeset(card, %{})
  end

  @doc """
  Returns the list of deck_cards.

  ## Examples

      iex> list_deck_cards()
      [%DeckCard{}, ...]

  """
  def list_deck_cards do
    Repo.all(DeckCard)
  end

  @doc """
  Returns the list of deck_cards.

  ## Examples

      iex> list_deck_cards()
      [%DeckCard{}, ...]

  """
  def list_undrawn_deck_cards(deck_id) do
    query =
      from dc in "deck_cards",
        where: dc.deck_id == ^deck_id and dc.drawn == false,
        select: dc.id

    Repo.all(query)
  end

  @doc """
  Gets a single deck_card.

  Raises `Ecto.NoResultsError` if the Deck card does not exist.

  ## Examples

      iex> get_deck_card!(123)
      %DeckCard{}

      iex> get_deck_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deck_card!(id), do: Repo.get!(DeckCard, id)

  @doc """
  Creates a deck_card.

  ## Examples

      iex> create_deck_card(%{field: value})
      {:ok, %DeckCard{}}

      iex> create_deck_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deck_card(attrs \\ %{}) do
    %DeckCard{}
    |> DeckCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deck_card.

  ## Examples

      iex> update_deck_card(deck_card, %{field: new_value})
      {:ok, %DeckCard{}}

      iex> update_deck_card(deck_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deck_card(%DeckCard{} = deck_card, attrs) do
    deck_card
    |> DeckCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a deck_card's drawn status.

  ## Examples

      iex> update_deck_card(deck_card, true)
      {:ok, %DeckCard{}}

      iex> update_deck_card(deck_card, false)
      {:ok, %DeckCard{}}

  """
  def update_drawn_status(%DeckCard{} = deck_card, drawn) do
    deck_card
    |> Ecto.Changeset.change(%{drawn: drawn})
    |> Hexen.Repo.update()
  end

  def shuffle_discard_into_deck(deck_id) do
    from(dc in DeckCard, where: dc.deck_id == ^deck_id, update: [set: [drawn: false]])
    |> Repo.update_all([])
  end

  @doc """
  Deletes a DeckCard.

  ## Examples

      iex> delete_deck_card(deck_card)
      {:ok, %DeckCard{}}

      iex> delete_deck_card(deck_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deck_card(%DeckCard{} = deck_card) do
    Repo.delete(deck_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deck_card changes.

  ## Examples

      iex> change_deck_card(deck_card)
      %Ecto.Changeset{source: %DeckCard{}}

  """
  def change_deck_card(%DeckCard{} = deck_card) do
    DeckCard.changeset(deck_card, %{})
  end
end
