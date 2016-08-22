defmodule Traverse.DashboardController do
  use Traverse.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
