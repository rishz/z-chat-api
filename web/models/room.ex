defmodule Zchat.Room do
  use Zchat.Web, :model

  schema "rooms" do
    field :name, :string
    belongs_to :owner, Zchat.Owner

    timestamps()
  end

  @allowed_fields ~w(name)a
  @required_fields @allowed_fields

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ %{}) do
    model

    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 4)
    |> unique_constraint(:name)

  end
end
