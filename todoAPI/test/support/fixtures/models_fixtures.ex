defmodule TodoAPI.ModelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoAPI.Models` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> TodoAPI.Models.create_todo()

    todo
  end
end
