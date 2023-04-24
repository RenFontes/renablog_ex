defmodule RenablogEx.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RenablogEx.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        tags: "some tags",
        title: "some title"
      })
      |> RenablogEx.Blog.create_post()

    post
  end
end
