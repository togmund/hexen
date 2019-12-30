defmodule Hexen.MapTest do
  use Hexen.DataCase

  alias Hexen.Map

  describe "regions" do
    alias Hexen.Map.Region

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def region_fixture(attrs \\ %{}) do
      {:ok, region} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.create_region()

      region
    end

    test "list_regions/0 returns all regions" do
      region = region_fixture()
      assert Map.list_regions() == [region]
    end

    test "get_region!/1 returns the region with given id" do
      region = region_fixture()
      assert Map.get_region!(region.id) == region
    end

    test "create_region/1 with valid data creates a region" do
      assert {:ok, %Region{} = region} = Map.create_region(@valid_attrs)
      assert region.name == "some name"
    end

    test "create_region/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Map.create_region(@invalid_attrs)
    end

    test "update_region/2 with valid data updates the region" do
      region = region_fixture()
      assert {:ok, %Region{} = region} = Map.update_region(region, @update_attrs)
      assert region.name == "some updated name"
    end

    test "update_region/2 with invalid data returns error changeset" do
      region = region_fixture()
      assert {:error, %Ecto.Changeset{}} = Map.update_region(region, @invalid_attrs)
      assert region == Map.get_region!(region.id)
    end

    test "delete_region/1 deletes the region" do
      region = region_fixture()
      assert {:ok, %Region{}} = Map.delete_region(region)
      assert_raise Ecto.NoResultsError, fn -> Map.get_region!(region.id) end
    end

    test "change_region/1 returns a region changeset" do
      region = region_fixture()
      assert %Ecto.Changeset{} = Map.change_region(region)
    end
  end

  describe "biomes" do
    alias Hexen.Map.Biome

    @valid_attrs %{name: "some name", resource: "some resource"}
    @update_attrs %{name: "some updated name", resource: "some updated resource"}
    @invalid_attrs %{name: nil, resource: nil}

    def biome_fixture(attrs \\ %{}) do
      {:ok, biome} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.create_biome()

      biome
    end

    test "list_biomes/0 returns all biomes" do
      biome = biome_fixture()
      assert Map.list_biomes() == [biome]
    end

    test "get_biome!/1 returns the biome with given id" do
      biome = biome_fixture()
      assert Map.get_biome!(biome.id) == biome
    end

    test "create_biome/1 with valid data creates a biome" do
      assert {:ok, %Biome{} = biome} = Map.create_biome(@valid_attrs)
      assert biome.name == "some name"
      assert biome.resource == "some resource"
    end

    test "create_biome/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Map.create_biome(@invalid_attrs)
    end

    test "update_biome/2 with valid data updates the biome" do
      biome = biome_fixture()
      assert {:ok, %Biome{} = biome} = Map.update_biome(biome, @update_attrs)
      assert biome.name == "some updated name"
      assert biome.resource == "some updated resource"
    end

    test "update_biome/2 with invalid data returns error changeset" do
      biome = biome_fixture()
      assert {:error, %Ecto.Changeset{}} = Map.update_biome(biome, @invalid_attrs)
      assert biome == Map.get_biome!(biome.id)
    end

    test "delete_biome/1 deletes the biome" do
      biome = biome_fixture()
      assert {:ok, %Biome{}} = Map.delete_biome(biome)
      assert_raise Ecto.NoResultsError, fn -> Map.get_biome!(biome.id) end
    end

    test "change_biome/1 returns a biome changeset" do
      biome = biome_fixture()
      assert %Ecto.Changeset{} = Map.change_biome(biome)
    end
  end

  describe "hexes" do
    alias Hexen.Map.Hex

    @valid_attrs %{name: "some name", resource: "some resource", structure: "some structure"}
    @update_attrs %{name: "some updated name", resource: "some updated resource", structure: "some updated structure"}
    @invalid_attrs %{name: nil, resource: nil, structure: nil}

    def hex_fixture(attrs \\ %{}) do
      {:ok, hex} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.create_hex()

      hex
    end

    test "list_hexes/0 returns all hexes" do
      hex = hex_fixture()
      assert Map.list_hexes() == [hex]
    end

    test "get_hex!/1 returns the hex with given id" do
      hex = hex_fixture()
      assert Map.get_hex!(hex.id) == hex
    end

    test "create_hex/1 with valid data creates a hex" do
      assert {:ok, %Hex{} = hex} = Map.create_hex(@valid_attrs)
      assert hex.name == "some name"
      assert hex.resource == "some resource"
      assert hex.structure == "some structure"
    end

    test "create_hex/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Map.create_hex(@invalid_attrs)
    end

    test "update_hex/2 with valid data updates the hex" do
      hex = hex_fixture()
      assert {:ok, %Hex{} = hex} = Map.update_hex(hex, @update_attrs)
      assert hex.name == "some updated name"
      assert hex.resource == "some updated resource"
      assert hex.structure == "some updated structure"
    end

    test "update_hex/2 with invalid data returns error changeset" do
      hex = hex_fixture()
      assert {:error, %Ecto.Changeset{}} = Map.update_hex(hex, @invalid_attrs)
      assert hex == Map.get_hex!(hex.id)
    end

    test "delete_hex/1 deletes the hex" do
      hex = hex_fixture()
      assert {:ok, %Hex{}} = Map.delete_hex(hex)
      assert_raise Ecto.NoResultsError, fn -> Map.get_hex!(hex.id) end
    end

    test "change_hex/1 returns a hex changeset" do
      hex = hex_fixture()
      assert %Ecto.Changeset{} = Map.change_hex(hex)
    end
  end

  describe "hex_users" do
    alias Hexen.Map.HexUser

    @valid_attrs %{departed: ~N[2010-04-17 14:00:00]}
    @update_attrs %{departed: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{departed: nil}

    def hex_user_fixture(attrs \\ %{}) do
      {:ok, hex_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Map.create_hex_user()

      hex_user
    end

    test "list_hex_users/0 returns all hex_users" do
      hex_user = hex_user_fixture()
      assert Map.list_hex_users() == [hex_user]
    end

    test "get_hex_user!/1 returns the hex_user with given id" do
      hex_user = hex_user_fixture()
      assert Map.get_hex_user!(hex_user.id) == hex_user
    end

    test "create_hex_user/1 with valid data creates a hex_user" do
      assert {:ok, %HexUser{} = hex_user} = Map.create_hex_user(@valid_attrs)
      assert hex_user.departed == ~N[2010-04-17 14:00:00]
    end

    test "create_hex_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Map.create_hex_user(@invalid_attrs)
    end

    test "update_hex_user/2 with valid data updates the hex_user" do
      hex_user = hex_user_fixture()
      assert {:ok, %HexUser{} = hex_user} = Map.update_hex_user(hex_user, @update_attrs)
      assert hex_user.departed == ~N[2011-05-18 15:01:01]
    end

    test "update_hex_user/2 with invalid data returns error changeset" do
      hex_user = hex_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Map.update_hex_user(hex_user, @invalid_attrs)
      assert hex_user == Map.get_hex_user!(hex_user.id)
    end

    test "delete_hex_user/1 deletes the hex_user" do
      hex_user = hex_user_fixture()
      assert {:ok, %HexUser{}} = Map.delete_hex_user(hex_user)
      assert_raise Ecto.NoResultsError, fn -> Map.get_hex_user!(hex_user.id) end
    end

    test "change_hex_user/1 returns a hex_user changeset" do
      hex_user = hex_user_fixture()
      assert %Ecto.Changeset{} = Map.change_hex_user(hex_user)
    end
  end
end
