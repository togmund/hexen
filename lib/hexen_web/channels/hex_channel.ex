defmodule HexenWeb.HexChannel do
  use HexenWeb, :channel

  alias Hexen.HexWorker

  def join("hex:" <> _room, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("select_card", msg, socket) do
    push(socket, "select_card", msg)
    {:noreply, socket}
  end

  def handle_in("selected_card", msg, socket) do
    HexWorker.perform_action(Map.fetch(msg, "room_name"), Map.fetch(msg, "deck_card_id"))
    {:noreply, socket}
  end

  def handle_in("clear_selection", msg, socket) do
    push(socket, "clear_selection", msg)
    {:noreply, socket}
  end

  # "SET_BOARD", "SET_HEX", "SET_HAND" All handled generically
  def handle_in(push_message, msg, socket) do
    push(socket, push_message, msg)
    {:noreply, socket}
  end
end
