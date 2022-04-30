defmodule TodoAPIWeb.TodoController do
  use TodoAPIWeb, :controller
  alias TodoAPI.Models
  alias TodoAPI.Models.Todo

  action_fallback TodoAPIWeb.FallbackController

  def index() do
  end

  def create() do
  end

  def show() do
  end

  def update() do
  end

  def delete() do
  end
end
