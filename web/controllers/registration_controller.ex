defmodule Zchat.RegistrationController do
  use Zchat.Web, :controller

  alias Zchat.User

  def create(
        conn,
        %{
          "data" => %{
            "type" => "users",
            "attributes" => %{
              "email" => email,
              "password" => password,
              "password-confirmation" => password_confirmation
            }
          }
        }
      ) do

    changeset = User.changeset %User{},
                               %{email: email,
                                 password_confirmation: password_confirmation,
                                 password: password}

    case Repo.insert changeset do
      {:ok, user} ->

        conn
        |> put_status(:created)
        |> render(Zchat.UserView, "show.json-api", data: user)

      {:error, changeset} ->

        conn
        |> put_status(:unprocessable_entity)
        |> render(Zchat.ChangesetView, "error.json", changeset: changeset)
    end

  end
end