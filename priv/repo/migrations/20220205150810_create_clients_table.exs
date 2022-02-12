defmodule SalactivErp.Repo.Migrations.CreateClientsTable do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :uuid, :string
      add :type_of_lead, :string, default: "General"
      add :promo_code, :string
      add :company_name, :string, null: false
      add :company_email, :string, null: false
      add :company_phone, :string, null: false
      add :country_id, :integer
      add :referred_by, references(:partners)
      add :created_by,  references(:users)
      add :assigned_to, references(:users)
      add :partner_id, references(:partners)
      add :wallpost_lead_id, :string
      add :is_client, :integer
      add :company_address, :string
      add :contact_first_name, :string
      add :contact_last_name, :string
      add :contact_email, :string
      add :contact_phone, :string
      add :company_city, :string
      add :company_street, :string
      add :latitude, :string
      add :longitude, :string
      add :location, :string

      add :package, :string

      timestamps()
    end
  end
end
