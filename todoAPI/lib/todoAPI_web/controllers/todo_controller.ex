defmodule TodoAPIWeb.TodoController do
  use TodoAPIWeb, :controller
  alias TodoAPI.Models
  alias TodoAPI.Models.Todo

  action_fallback TodoAPIWeb.FallbackController

  def index(conn, _params) do
    # Were getting list_todos which renders all todos
    todos = Models.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, todo_params) do
    with {:ok, %Todo{} = todo} <- Models.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_path(conn, :show, todo))
      |> render('show.json', todo: todo)
    end
  end

  def show(conn, %{id: id}) do
    # Getting individual todo task
    todo = Models.get_todo!(id)
    render(conn, "index.json", todo: todo)
  end

  def update(conn, todo_params) do
    todo = Models.get_todo!(conn.path_params["id"])
    # Get todo by ID and update it
    with {:ok, %Todo{} = todo} <- Models.update_todo(todo, todo_params) do
      render(conn, "show.json", todo: todo)
    end
  end

  def delete(conn, %{id: id}) do
    todo = Models.get_todo!(id)

    with {:ok, %Todo{} = todo} <- Models.delete_todo(todo) do
      # This means render no content in the string
      render(conn, :no_content, "")
    end
  end
end
