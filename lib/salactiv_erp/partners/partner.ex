defmodule SalactivErp.Partner.Partner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "partners" do

    field :name, :string
    field :email, :string
    field :phone, :string
    field :registrant_user_id, :integer
    field :user_id,  :integer
    field :country_id, :integer
    field :partner_type_id, :integer
    field :crm_company_id, :string
    field :auto_accept_lead, :string
    field :exclude_from_accept_lead, :string
    field :proposal_auto_accept, :string
    field :telecoms_sends_proposal, :string
    field :telecoms_sends_engagement, :string
    field :engagement_auto_accept, :string
    field :crm_partner_id, :string
    field :assignto_nearest, :string
    field :telecoms_pending_activation_acceptance, :string
    field :telecoms_engagement_acceptance_status, :string
    field :latitude, :string
    field :longitude, :string
    field :partner_category_id, :string
    field :account_number, :string
    field :can_do_activation, :string
    field :status, :string


#    belongs_to :country, SalactivErp.Country.Country
#    belongs_to :assignee,  SalactivErp.Accounts.User, foreign_key: :assigned_to, references: :id
#    belongs_to :assigneePartner,  SalactivErp.Accounts.User, foreign_key: :partner_id, references: :id


                                                                        timestamps()
  end


  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uuid,
      :type_of_lead,
      :promo_code,
      :company_name,
      :company_email,
      :company_phone,
      :country_id,
      :referred_by,
      :created_by,
      :assigned_to,
      :partner_id,
      :wallpost_lead_id,
      :is_client,
      :company_address,
      :contact_first_name,
      :contact_last_name,
      :contact_email,
      :contact_phone,
      :company_city,
      :company_street,
      :latitude,
      :longitude,
      :location,
      :package ])
    |> validate_required([:company_name, :country_id ])
  end

end
