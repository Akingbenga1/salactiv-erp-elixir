defmodule SalactivErpWeb.Plugs.RequireAuth do

  import Plug.Conn
  import Phoenix.Controller

  alias SalactivErpWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    token = get_session(conn, "user_token")
#    IO.puts "++++++++++"
#    IO.inspect (token)
#    if conn.assigns[:user] do
    if token do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to:  Helpers.page_path(conn, :login))
      |> halt()
    end
  end

end
