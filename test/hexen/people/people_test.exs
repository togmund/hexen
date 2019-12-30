defmodule Hexen.PeopleTest do
  use Hexen.DataCase

  alias Hexen.People

  describe "bands" do
    alias Hexen.People.Band

    @valid_attrs %{name: "some name", sigil: "some sigil"}
    @update_attrs %{name: "some updated name", sigil: "some updated sigil"}
    @invalid_attrs %{name: nil, sigil: nil}

    def band_fixture(attrs \\ %{}) do
      {:ok, band} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_band()

      band
    end

    test "list_bands/0 returns all bands" do
      band = band_fixture()
      assert People.list_bands() == [band]
    end

    test "get_band!/1 returns the band with given id" do
      band = band_fixture()
      assert People.get_band!(band.id) == band
    end

    test "create_band/1 with valid data creates a band" do
      assert {:ok, %Band{} = band} = People.create_band(@valid_attrs)
      assert band.name == "some name"
      assert band.sigil == "some sigil"
    end

    test "create_band/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_band(@invalid_attrs)
    end

    test "update_band/2 with valid data updates the band" do
      band = band_fixture()
      assert {:ok, %Band{} = band} = People.update_band(band, @update_attrs)
      assert band.name == "some updated name"
      assert band.sigil == "some updated sigil"
    end

    test "update_band/2 with invalid data returns error changeset" do
      band = band_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_band(band, @invalid_attrs)
      assert band == People.get_band!(band.id)
    end

    test "delete_band/1 deletes the band" do
      band = band_fixture()
      assert {:ok, %Band{}} = People.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> People.get_band!(band.id) end
    end

    test "change_band/1 returns a band changeset" do
      band = band_fixture()
      assert %Ecto.Changeset{} = People.change_band(band)
    end
  end

  describe "users" do
    alias Hexen.People.User

    @valid_attrs %{avatar: "some avatar", email: "some email", name: "some name"}
    @update_attrs %{avatar: "some updated avatar", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{avatar: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert People.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert People.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = People.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = People.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_user(user, @invalid_attrs)
      assert user == People.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = People.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> People.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = People.change_user(user)
    end
  end
end
