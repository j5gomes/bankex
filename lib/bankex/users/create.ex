defmodule Bankex.Users.Create do
  alias Bankex.Users.User
  alias Bankex.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
