defmodule Traverse.AuthController do
  use Traverse.Web, :controller
  plug Ueberauth

  def request(conn, _params) do
    render(conn, "login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  def callback(%Plug.Conn{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    conn
    |> put_flash(:error, hd(fails.errors).message)
    |> render("login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  def callback(%Plug.Conn{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    redirect(conn, to: "/")
  end
end
