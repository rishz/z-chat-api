defmodule Zchat.UserView do
  use Zchat.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Zchat.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Zchat.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      "type": "user",
      "id": user.id,
      "attributes": %{
        "email": user.email
      }
    }
  end
end