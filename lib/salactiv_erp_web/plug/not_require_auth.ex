defmodule SalactivErpWeb.Plugs.NotRequireAuth do

  import Plug.Conn
  import Phoenix.Controller

  alias SalactivErpWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    token = get_session(conn, "user_token")
    IO.puts "++++++++++"
    IO.inspect (token)
#    if conn.assigns[:user] do
    if token do
      conn
      |> put_flash(:error, "You are already logged in.")
      |> redirect(to:  Helpers.page_path(conn, :dashboard))
    else
      conn
    end
  end

end
