defmodule Zchat.Router do
  use Zchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Zchat do
    pipe_through :api
    resources "session", SessionController, only: [:index]
  end
end
