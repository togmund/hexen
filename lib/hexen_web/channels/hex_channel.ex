defmodule HexenWeb.HexChannel do
  use HexenWeb, :channel

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

  def handle_in("selected_card", msg, socket) do
    IO.puts("Card Selected Is: #{Map.fetch!(msg, "card")}")
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
