defmodule BankexWeb.WelcomeController do
  use BankexWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Bankex, the Elixir Bank", status: :ok})
  end
end
