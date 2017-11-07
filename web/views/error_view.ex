defmodule Zchat.ErrorView do
  use Zchat.Web, :view
  use JaSerializer.PhoenixView # Or use in web/web.ex

  def render("401.json", _assigns) do
    %{title: "Unauthorized", code: 401}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("500.json", _assigns) do
    %{title: "Internal Server Error", code: 500}
    |> JaSerializer.ErrorSerializer.format
  end

  # # In case no render clause matches or no
  # # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end