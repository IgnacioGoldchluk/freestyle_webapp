defmodule FreestyleWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:freestyle_stream", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _invalid_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
