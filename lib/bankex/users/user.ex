defmodule Bankex.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :password_hash, :email, :nif]

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :nif, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:nif, min: 9)
  end
end
