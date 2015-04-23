defmodule NashEx.PageController do
  use NashEx.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
