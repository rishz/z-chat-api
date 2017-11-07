defmodule Zchat.AuthErrorHandler do
  use Zchat.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(Zchat.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(Zchat.ErrorView, "403.json")
  end
end