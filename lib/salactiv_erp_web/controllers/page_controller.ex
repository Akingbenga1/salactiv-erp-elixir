defmodule SalactivErpWeb.PageController do
  use SalactivErpWeb, :controller
  alias SalactivErpWeb.Router.Helpers, as: Routes
  alias SalactivErpWeb.Endpoint
  alias SalactivErp.Accounts
  alias SalactivErpWeb.UserAuth

  plug SalactivErpWeb.Plugs.RequireAuth when action in [:dashboard]

  plug SalactivErpWeb.Plugs.NotRequireAuth when action in [:login]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, _params) do
    render conn, "login.html", form_csrt_token: get_csrf_token()
  end

  def signin(conn, params) do

    IO.puts "++++++++++"
    IO.inspect params
    IO.puts "++++++++++"

    %{"email" => user_email, "password" => user_password} =  params
     IO.inspect user_email
     IO.inspect user_password
     IO.puts "++++++++++"


     user = Accounts.get_user_by_email_and_password(user_email, user_password )
     if !user do
      conn
      |> redirect(to: Routes.page_path(Endpoint,  :login ) )
       else
      token = Accounts.generate_user_session_token(user)
      if token do
        IO.inspect (token)
        IO.puts "++++++++++"
        conn
        |> put_session(:user_token, token)
        |> redirect(to: Routes.page_path(Endpoint,  :dashboard ) )
      else
        conn
        |> put_session(:user_token, token)
        |> redirect(to: Routes.page_path(Endpoint,  :login ) )
      end
    end
    conn
  end

  def dashboard(conn, _params) do
    render(conn, "dashboard.html" ,  layout: {SalactivErpWeb.LayoutView, "inner.html"} )
  end

  def logout_signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(Endpoint,  :login ) )
  end
end
