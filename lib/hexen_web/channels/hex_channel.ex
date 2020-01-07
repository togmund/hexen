defmodule HexenWeb.HexChannel do
  use HexenWeb, :channel
  alias HexenWeb.HexPresence

  def join("hex:" <> hex_id, _payload, socket) do
    # send(self(), :after_join)

    # {:ok, %{channel: "hex:#{hex_id}"}, assign(socket, :hex_id, hex_id),
    #  assign(socket, :user_id, verified_user_id)}

    {:ok, socket}

    # if authorized?(payload) do
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  def handle_info(:after_join, socket) do
    push(socket, "presence_state", HexPresence.list(socket))

    {:ok, _} =
      HexPresence.track(socket, socket.assigns.user_id, %{
        online_at: inspect(System.system_time(:second))
      })

    {:noreply, socket}
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
    IO.puts("Card Selected Is: #{msg}")
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
