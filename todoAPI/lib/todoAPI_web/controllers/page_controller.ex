defmodule TodoAPIWeb.PageController do
  use TodoAPIWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
