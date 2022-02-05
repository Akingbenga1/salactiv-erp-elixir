defmodule SalactivErpWeb.LeadController do
  use SalactivErpWeb, :controller
  alias SalactivErpWeb.Router.Helpers, as: Routes
  alias SalactivErpWeb.Endpoint
  alias SalactivErp.Accounts
  alias SalactivErpWeb.UserAuth

  plug SalactivErpWeb.Plugs.RequireAuth

  def create(conn, _params) do
    render(conn, "create_lead.html" ,  layout: {SalactivErpWeb.LayoutView, "inner.html"} )
  end

  def post(conn, _params) do
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
    token = get_session(conn, "user_token")
    IO.puts "++++ Dashboard token ++++++"
    IO.inspect (token)
#    user = user_token && Accounts.get_user_by_session_token(user_token)
#    assign(conn, :current_user, user)

    IO.puts "++++ Dashboard current_user ++++++"
    IO.inspect (conn.assigns[:current_user])
    render(conn, "dashboard.html" ,   layout: {SalactivErpWeb.LayoutView, "inner.html"} )
  end

  def logout_signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(Endpoint,  :login ) )
  end
end
