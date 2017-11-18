defmodule Zchat.Room do
  use Zchat.Web, :model

  schema "rooms" do
    field :name, :string
    belongs_to :owner, Zchat.Owner

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model

    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 4)
    |> unique_constraint(:name)

  end
end
