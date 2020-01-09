defmodule HexenWeb.HexChannel do
  use HexenWeb, :channel

  alias Hexen.HexWorker

  def join("hex:" <> _room, _payload, socket) do
    # if authorized?(payload) do
    {:ok, socket}
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  # # Channels can be used in a request/response fashion
  # # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # # It is also common to receive messages from the client and
  # # broadcast to everyone in the current topic (hex:lobby).
  # def handle_in("shout", payload, socket) do
  #   broadcast(socket, "shout", payload)
  #   {:noreply, socket}
  # end

  def handle_in("hex_state", msg, socket) do
    push(socket, "hex_state", msg)
    {:noreply, socket}
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

  def handle_in("render_map", msg, socket) do
    push(socket, "render_map", msg)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
