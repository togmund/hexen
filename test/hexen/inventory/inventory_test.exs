defmodule Hexen.InventoryTest do
  use Hexen.DataCase

  alias Hexen.Inventory

  describe "decks" do
    alias Hexen.Inventory.Deck

    @valid_attrs %{cardback: "some cardback", name: "some name"}
    @update_attrs %{cardback: "some updated cardback", name: "some updated name"}
    @invalid_attrs %{cardback: nil, name: nil}

    def deck_fixture(attrs \\ %{}) do
      {:ok, deck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_deck()

      deck
    end

    test "list_decks/0 returns all decks" do
      deck = deck_fixture()
      assert Inventory.list_decks() == [deck]
    end

    test "get_deck!/1 returns the deck with given id" do
      deck = deck_fixture()
      assert Inventory.get_deck!(deck.id) == deck
    end

    test "create_deck/1 with valid data creates a deck" do
      assert {:ok, %Deck{} = deck} = Inventory.create_deck(@valid_attrs)
      assert deck.cardback == "some cardback"
      assert deck.name == "some name"
    end

    test "create_deck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_deck(@invalid_attrs)
    end

    test "update_deck/2 with valid data updates the deck" do
      deck = deck_fixture()
      assert {:ok, %Deck{} = deck} = Inventory.update_deck(deck, @update_attrs)
      assert deck.cardback == "some updated cardback"
      assert deck.name == "some updated name"
    end

    test "update_deck/2 with invalid data returns error changeset" do
      deck = deck_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_deck(deck, @invalid_attrs)
      assert deck == Inventory.get_deck!(deck.id)
    end

    test "delete_deck/1 deletes the deck" do
      deck = deck_fixture()
      assert {:ok, %Deck{}} = Inventory.delete_deck(deck)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_deck!(deck.id) end
    end

    test "change_deck/1 returns a deck changeset" do
      deck = deck_fixture()
      assert %Ecto.Changeset{} = Inventory.change_deck(deck)
    end
  end

  describe "cards" do
    alias Hexen.Inventory.Card

    @valid_attrs %{description: "some description", image: "some image", modifier: 42, name: "some name", suit: "some suit"}
    @update_attrs %{description: "some updated description", image: "some updated image", modifier: 43, name: "some updated name", suit: "some updated suit"}
    @invalid_attrs %{description: nil, image: nil, modifier: nil, name: nil, suit: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Inventory.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Inventory.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Inventory.create_card(@valid_attrs)
      assert card.description == "some description"
      assert card.image == "some image"
      assert card.modifier == 42
      assert card.name == "some name"
      assert card.suit == "some suit"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, %Card{} = card} = Inventory.update_card(card, @update_attrs)
      assert card.description == "some updated description"
      assert card.image == "some updated image"
      assert card.modifier == 43
      assert card.name == "some updated name"
      assert card.suit == "some updated suit"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_card(card, @invalid_attrs)
      assert card == Inventory.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Inventory.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Inventory.change_card(card)
    end
  end

  describe "deck_cards" do
    alias Hexen.Inventory.DeckCard

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def deck_card_fixture(attrs \\ %{}) do
      {:ok, deck_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_deck_card()

      deck_card
    end

    test "list_deck_cards/0 returns all deck_cards" do
      deck_card = deck_card_fixture()
      assert Inventory.list_deck_cards() == [deck_card]
    end

    test "get_deck_card!/1 returns the deck_card with given id" do
      deck_card = deck_card_fixture()
      assert Inventory.get_deck_card!(deck_card.id) == deck_card
    end

    test "create_deck_card/1 with valid data creates a deck_card" do
      assert {:ok, %DeckCard{} = deck_card} = Inventory.create_deck_card(@valid_attrs)
    end

    test "create_deck_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_deck_card(@invalid_attrs)
    end

    test "update_deck_card/2 with valid data updates the deck_card" do
      deck_card = deck_card_fixture()
      assert {:ok, %DeckCard{} = deck_card} = Inventory.update_deck_card(deck_card, @update_attrs)
    end

    test "update_deck_card/2 with invalid data returns error changeset" do
      deck_card = deck_card_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_deck_card(deck_card, @invalid_attrs)
      assert deck_card == Inventory.get_deck_card!(deck_card.id)
    end

    test "delete_deck_card/1 deletes the deck_card" do
      deck_card = deck_card_fixture()
      assert {:ok, %DeckCard{}} = Inventory.delete_deck_card(deck_card)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_deck_card!(deck_card.id) end
    end

    test "change_deck_card/1 returns a deck_card changeset" do
      deck_card = deck_card_fixture()
      assert %Ecto.Changeset{} = Inventory.change_deck_card(deck_card)
    end
  end
end
