defmodule Hexen.EventsTest do
  use Hexen.DataCase

  alias Hexen.Events

  describe "quests" do
    alias Hexen.Events.Quest

    @valid_attrs %{description: "some description", name: "some name", requirement: 42}
    @update_attrs %{description: "some updated description", name: "some updated name", requirement: 43}
    @invalid_attrs %{description: nil, name: nil, requirement: nil}

    def quest_fixture(attrs \\ %{}) do
      {:ok, quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_quest()

      quest
    end

    test "list_quests/0 returns all quests" do
      quest = quest_fixture()
      assert Events.list_quests() == [quest]
    end

    test "get_quest!/1 returns the quest with given id" do
      quest = quest_fixture()
      assert Events.get_quest!(quest.id) == quest
    end

    test "create_quest/1 with valid data creates a quest" do
      assert {:ok, %Quest{} = quest} = Events.create_quest(@valid_attrs)
      assert quest.description == "some description"
      assert quest.name == "some name"
      assert quest.requirement == 42
    end

    test "create_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_quest(@invalid_attrs)
    end

    test "update_quest/2 with valid data updates the quest" do
      quest = quest_fixture()
      assert {:ok, %Quest{} = quest} = Events.update_quest(quest, @update_attrs)
      assert quest.description == "some updated description"
      assert quest.name == "some updated name"
      assert quest.requirement == 43
    end

    test "update_quest/2 with invalid data returns error changeset" do
      quest = quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_quest(quest, @invalid_attrs)
      assert quest == Events.get_quest!(quest.id)
    end

    test "delete_quest/1 deletes the quest" do
      quest = quest_fixture()
      assert {:ok, %Quest{}} = Events.delete_quest(quest)
      assert_raise Ecto.NoResultsError, fn -> Events.get_quest!(quest.id) end
    end

    test "change_quest/1 returns a quest changeset" do
      quest = quest_fixture()
      assert %Ecto.Changeset{} = Events.change_quest(quest)
    end
  end

  describe "user_quests" do
    alias Hexen.Events.UserQuest

    @valid_attrs %{progress: 42}
    @update_attrs %{progress: 43}
    @invalid_attrs %{progress: nil}

    def user_quest_fixture(attrs \\ %{}) do
      {:ok, user_quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_user_quest()

      user_quest
    end

    test "list_user_quests/0 returns all user_quests" do
      user_quest = user_quest_fixture()
      assert Events.list_user_quests() == [user_quest]
    end

    test "get_user_quest!/1 returns the user_quest with given id" do
      user_quest = user_quest_fixture()
      assert Events.get_user_quest!(user_quest.id) == user_quest
    end

    test "create_user_quest/1 with valid data creates a user_quest" do
      assert {:ok, %UserQuest{} = user_quest} = Events.create_user_quest(@valid_attrs)
      assert user_quest.progress == 42
    end

    test "create_user_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_user_quest(@invalid_attrs)
    end

    test "update_user_quest/2 with valid data updates the user_quest" do
      user_quest = user_quest_fixture()
      assert {:ok, %UserQuest{} = user_quest} = Events.update_user_quest(user_quest, @update_attrs)
      assert user_quest.progress == 43
    end

    test "update_user_quest/2 with invalid data returns error changeset" do
      user_quest = user_quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_user_quest(user_quest, @invalid_attrs)
      assert user_quest == Events.get_user_quest!(user_quest.id)
    end

    test "delete_user_quest/1 deletes the user_quest" do
      user_quest = user_quest_fixture()
      assert {:ok, %UserQuest{}} = Events.delete_user_quest(user_quest)
      assert_raise Ecto.NoResultsError, fn -> Events.get_user_quest!(user_quest.id) end
    end

    test "change_user_quest/1 returns a user_quest changeset" do
      user_quest = user_quest_fixture()
      assert %Ecto.Changeset{} = Events.change_user_quest(user_quest)
    end
  end

  describe "card_quests" do
    alias Hexen.Events.CardQuest

    @valid_attrs %{progress: 42}
    @update_attrs %{progress: 43}
    @invalid_attrs %{progress: nil}

    def card_quest_fixture(attrs \\ %{}) do
      {:ok, card_quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_card_quest()

      card_quest
    end

    test "list_card_quests/0 returns all card_quests" do
      card_quest = card_quest_fixture()
      assert Events.list_card_quests() == [card_quest]
    end

    test "get_card_quest!/1 returns the card_quest with given id" do
      card_quest = card_quest_fixture()
      assert Events.get_card_quest!(card_quest.id) == card_quest
    end

    test "create_card_quest/1 with valid data creates a card_quest" do
      assert {:ok, %CardQuest{} = card_quest} = Events.create_card_quest(@valid_attrs)
      assert card_quest.progress == 42
    end

    test "create_card_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_card_quest(@invalid_attrs)
    end

    test "update_card_quest/2 with valid data updates the card_quest" do
      card_quest = card_quest_fixture()
      assert {:ok, %CardQuest{} = card_quest} = Events.update_card_quest(card_quest, @update_attrs)
      assert card_quest.progress == 43
    end

    test "update_card_quest/2 with invalid data returns error changeset" do
      card_quest = card_quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_card_quest(card_quest, @invalid_attrs)
      assert card_quest == Events.get_card_quest!(card_quest.id)
    end

    test "delete_card_quest/1 deletes the card_quest" do
      card_quest = card_quest_fixture()
      assert {:ok, %CardQuest{}} = Events.delete_card_quest(card_quest)
      assert_raise Ecto.NoResultsError, fn -> Events.get_card_quest!(card_quest.id) end
    end

    test "change_card_quest/1 returns a card_quest changeset" do
      card_quest = card_quest_fixture()
      assert %Ecto.Changeset{} = Events.change_card_quest(card_quest)
    end
  end

  describe "band_quests" do
    alias Hexen.Events.BandQuest

    @valid_attrs %{progress: 42}
    @update_attrs %{progress: 43}
    @invalid_attrs %{progress: nil}

    def band_quest_fixture(attrs \\ %{}) do
      {:ok, band_quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_band_quest()

      band_quest
    end

    test "list_band_quests/0 returns all band_quests" do
      band_quest = band_quest_fixture()
      assert Events.list_band_quests() == [band_quest]
    end

    test "get_band_quest!/1 returns the band_quest with given id" do
      band_quest = band_quest_fixture()
      assert Events.get_band_quest!(band_quest.id) == band_quest
    end

    test "create_band_quest/1 with valid data creates a band_quest" do
      assert {:ok, %BandQuest{} = band_quest} = Events.create_band_quest(@valid_attrs)
      assert band_quest.progress == 42
    end

    test "create_band_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_band_quest(@invalid_attrs)
    end

    test "update_band_quest/2 with valid data updates the band_quest" do
      band_quest = band_quest_fixture()
      assert {:ok, %BandQuest{} = band_quest} = Events.update_band_quest(band_quest, @update_attrs)
      assert band_quest.progress == 43
    end

    test "update_band_quest/2 with invalid data returns error changeset" do
      band_quest = band_quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_band_quest(band_quest, @invalid_attrs)
      assert band_quest == Events.get_band_quest!(band_quest.id)
    end

    test "delete_band_quest/1 deletes the band_quest" do
      band_quest = band_quest_fixture()
      assert {:ok, %BandQuest{}} = Events.delete_band_quest(band_quest)
      assert_raise Ecto.NoResultsError, fn -> Events.get_band_quest!(band_quest.id) end
    end

    test "change_band_quest/1 returns a band_quest changeset" do
      band_quest = band_quest_fixture()
      assert %Ecto.Changeset{} = Events.change_band_quest(band_quest)
    end
  end

  describe "hex_quests" do
    alias Hexen.Events.HexQuest

    @valid_attrs %{progress: 42}
    @update_attrs %{progress: 43}
    @invalid_attrs %{progress: nil}

    def hex_quest_fixture(attrs \\ %{}) do
      {:ok, hex_quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_hex_quest()

      hex_quest
    end

    test "list_hex_quests/0 returns all hex_quests" do
      hex_quest = hex_quest_fixture()
      assert Events.list_hex_quests() == [hex_quest]
    end

    test "get_hex_quest!/1 returns the hex_quest with given id" do
      hex_quest = hex_quest_fixture()
      assert Events.get_hex_quest!(hex_quest.id) == hex_quest
    end

    test "create_hex_quest/1 with valid data creates a hex_quest" do
      assert {:ok, %HexQuest{} = hex_quest} = Events.create_hex_quest(@valid_attrs)
      assert hex_quest.progress == 42
    end

    test "create_hex_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_hex_quest(@invalid_attrs)
    end

    test "update_hex_quest/2 with valid data updates the hex_quest" do
      hex_quest = hex_quest_fixture()
      assert {:ok, %HexQuest{} = hex_quest} = Events.update_hex_quest(hex_quest, @update_attrs)
      assert hex_quest.progress == 43
    end

    test "update_hex_quest/2 with invalid data returns error changeset" do
      hex_quest = hex_quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_hex_quest(hex_quest, @invalid_attrs)
      assert hex_quest == Events.get_hex_quest!(hex_quest.id)
    end

    test "delete_hex_quest/1 deletes the hex_quest" do
      hex_quest = hex_quest_fixture()
      assert {:ok, %HexQuest{}} = Events.delete_hex_quest(hex_quest)
      assert_raise Ecto.NoResultsError, fn -> Events.get_hex_quest!(hex_quest.id) end
    end

    test "change_hex_quest/1 returns a hex_quest changeset" do
      hex_quest = hex_quest_fixture()
      assert %Ecto.Changeset{} = Events.change_hex_quest(hex_quest)
    end
  end
end
