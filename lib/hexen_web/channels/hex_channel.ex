defmodule HexenWeb.HexChannel do
  @moduledoc """
    Module Documentation
  """
  use HexenWeb, :channel

  alias Hexen.HexWorker

  def join("hex:" <> room, _payload, socket) do
    IO.inspect(room, label: "Our room")
    {:ok, socket}
  end

  def handle_in("selected_card", msg, socket) do
    HexWorker.perform_action(
      msg["room_name"],
      msg["deck_card_id"],
      msg["user_id"],
      msg["target_hex_id"],
      msg["target_user_id"],
      msg["tile_id"]
    )

    {:noreply, socket}
  end

  def handle_in("clear_selection", msg, socket) do
    push(socket, "clear_selection", msg)
    {:noreply, socket}
  end

  # "SET_BOARD", "SET_HEX", "SET_HAND", "GET_CARD", "SET_QUESTS" All handled generically
  def handle_in(push_message, msg, socket) do
    push(socket, push_message, msg)
    {:noreply, socket}
  end
end
