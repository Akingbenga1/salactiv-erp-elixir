defmodule SalactivErp.Repo.Migrations.CreatePartnerTable do
  use Ecto.Migration

  def change do
      create table(:partners) do
        add :name, :string, null: false
        add :email, :string, null: false
        add :phone, :string
        add :registrant_user_id, references(:users)
        add :user_id,  references(:users)
        add :country_id, :integer
        add :partner_type_id, :integer
        add :crm_company_id, :string
        add :auto_accept_lead, :string
        add :exclude_from_accept_lead, :string
        add :proposal_auto_accept, :string
        add :telecoms_sends_proposal, :string
        add :telecoms_sends_engagement, :string
        add :engagement_auto_accept, :string
        add :crm_partner_id, :string
        add :assignto_nearest, :string
        add :telecoms_pending_activation_acceptance, :string
        add :telecoms_engagement_acceptance_status, :string
        add :latitude, :string
        add :longitude, :string
        add :partner_category_id, :string
        add :account_number, :string
        add :can_do_activation, :string
        add :status, :string, default: "active"

        timestamps()
    end
  end
end

