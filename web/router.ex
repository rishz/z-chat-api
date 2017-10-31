defmodule Zchat.Router do
  use Zchat.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Zchat do
    pipe_through :api
  end
end
