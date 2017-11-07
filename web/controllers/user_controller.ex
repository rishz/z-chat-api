defmodule Zchat.UserController do
  use Zchat.Web, :controller

  alias Zchat.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Zchat.AuthErrorHandler

  def current(conn, _) do
    user = conn
           |> Guardian.Plug.current_resource

    conn
    |> render(Zchat.UserView, "show.json", user: user)
  end
end