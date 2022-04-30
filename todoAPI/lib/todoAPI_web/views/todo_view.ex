defmodule TodoAPIWeb.TodoView do
  use TodoAPIWeb, :view

  # Define how to render json
  def render("index.json", %{todos: todos}) do
    # Rendering collection of objects
    render_many(todos, TodoAPIWeb.TodoView, 'todo.json')
  end

  def render("show.json", %{todo: todo}) do
    # Render one map in the collection
    render_one(todo, TodoAPIWeb.TodoView, 'todo.json')
  end

  def render("todo.json", %{todo: todo}) do
    %{
      id: todo.id,
      title: todo.title,
      completed: todo.completed
    }
  end
end
