defmodule Zchat.Router do
  use Zchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Zchat do
    pipe_through :api
    post "register", RegistrationController, :create
    post "token", SessionController, :create, as: :login
  end

end
