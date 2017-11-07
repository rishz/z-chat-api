defmodule Zchat.Router do
  use Zchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Zchat do
    pipe_through :api

    # Registration
    post "register", RegistrationController, :create

    # Login
    post "token", SessionController, :create, as: :login
  end

end
