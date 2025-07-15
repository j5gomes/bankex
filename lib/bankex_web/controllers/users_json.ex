defmodule BankexWeb.UsersJSON do
  alias Bankex.Users.User

  def create(%{user: user}) do
    %{
      message: "User successfully created!",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      nif: user.nif,
      email: user.email
    }
  end
end
