defmodule Bankex.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Argon2

  alias Ecto.Changeset

  @required_params [:name, :password, :email, :nif]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
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
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, hash_pwd_salt(password))
  end

  defp add_password_hash(changeset), do: changeset
end
