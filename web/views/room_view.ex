defmodule Zchat.RoomView do
  use Zchat.Web, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, Zchat.RoomView, "room.json")}
  end

  def render("show.json", %{room: room}) do
    %{data: render_one(room, Zchat.RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{id: room.id,
      name: room.name,
      owner_id: room.owner_id}
  end
end
