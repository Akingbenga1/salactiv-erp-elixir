defmodule SalactivErpWeb.PageController do
  use SalactivErpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
