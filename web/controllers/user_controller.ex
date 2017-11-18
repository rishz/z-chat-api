defmodule Zchat.UserController do
  use Zchat.Web, :controller

  alias Zchat.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Zchat.AuthErrorHandler

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json-api", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json-api", data: user)
  end

  def current(conn, _) do
    user = conn
           |> Guardian.Plug.current_resource

    conn
    |> render(Zchat.UserView, "show.json-api", data: user)
  end
end