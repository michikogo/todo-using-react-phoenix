defmodule TodoAPIWeb.FallbackController do
  use TodoAPIWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    # Cannot process an entity ex. wrong entity
    |> put_status(:unprocessable_entity)
    |> put_view(TodoAPIWeb.ChangesetView)
    # Output error.json
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    # Call with particular id and not in the database
    |> put_status(:not_found)
    |> put_view(TodoAPIWeb.ErrorView)
    # Output 404
    |> render(:"404")
  end
end
