defmodule BankexWeb.ErrorJSONTest do
  use BankexWeb.ConnCase, async: true

  test "renders 404" do
    assert BankexWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert BankexWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
