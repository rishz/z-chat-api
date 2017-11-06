defmodule Zchat.SessionController do
  use Zchat.Web, :controller

  def create(conn, %{"grant_type" => "password",
    "username" => username,
    "password" => password}) do

  end

  def create(conn, %{"grant_type" => _}) do
    throw "Unsupported grant_type"
  end

end