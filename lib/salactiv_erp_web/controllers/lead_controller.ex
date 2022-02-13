defmodule SalactivErpWeb.LeadController do
  use SalactivErpWeb, :controller
  alias SalactivErpWeb.Router.Helpers, as: Routes
  alias SalactivErpWeb.Endpoint
  alias SalactivErp.Accounts
  alias SalactivErpWeb.UserAuth
  alias SalactivErp.Repo
  alias SalactivErp.Country.Country
  alias SalactivErp.Client.Client


  plug SalactivErpWeb.Plugs.RequireAuth

  def create(conn, _params) do

    countries = Repo.all(Country)

    render(conn, "create_lead.html", form_csrf_token: get_csrf_token(), countries: countries,
           layout: {SalactivErpWeb.LayoutView, "inner.html"} )
  end

  def list(conn, _params) do

    clients  = Repo.all(Client) |> Repo.preload([:country, :assignee, :assigneePartner])
    countries = Repo.all(Country)

    IO.puts "++++++++++"
    IO.inspect clients
    IO.puts "++++++++++"

    render(conn, "list_lead.html", form_csrf_token: get_csrf_token(), countries: countries, clients: clients,
           layout: { SalactivErpWeb.LayoutView, "inner.html"} )
  end

  def post_create(conn, params) do

    IO.puts "++++++++++"
    IO.inspect params
    IO.puts "++++++++++"

    countries = Repo.all(Country)
     # Run validation and save client to DB s

    clientInsertData = %Client{
                                    :promo_code =>  "D4536",
                                    :company_name =>  params["company_name"],
                                    :company_email =>  params["company_email"],
                                    :company_phone =>  params["company_phone"],
                                    :company_city =>  params["company_city"],
                                    :country_id =>  String.to_integer(params["country"]) ,
                                    :referred_by =>  1,
                                    :created_by =>  1,
                                    :assigned_to =>  1,
                                    :partner_id =>  1,
                                    :wallpost_lead_id =>  "PLererrlsdkk324",
                                    :is_client =>  0,
                                    :contact_first_name => params["contact_first_name"],
                                    :contact_last_name =>  params["contact_last_name"],
                                    :contact_email => params["company_email"],
                                    :contact_phone =>  params["company_phone"],
                                    :contact_email =>  params["company_email"],
                                    :company_street =>  params["company_address"],
                                    :company_address =>  params["company_address"],
                                    :package =>  params["package"],
                                    :longitude => "-100.445882",
                                    :latitude =>  "39.7837304",
                                    :location =>  "-100.445882,39.7837304"
                              }

    case Repo.insert(clientInsertData) do
      {:ok, _client} ->
        conn
        |> put_flash(:info, "Client created successfully.")
        |> redirect(to:  Routes.lead_path(Endpoint,  :list ))
      {:error, _changeset} ->
        render(conn, "create_lead.html" , form_csrf_token: get_csrf_token() , countries: countries  ,  layout: {SalactivErpWeb.LayoutView, "inner.html"} )
    end


  end
end
