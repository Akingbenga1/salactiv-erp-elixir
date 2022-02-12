defmodule SalactivErp.Repo.Migrations.AlterPartnersTable do
  use Ecto.Migration

  def change do
    alter table(:partners) do
      modify :country_id, references(:countries)
      modify :partner_type_id, references(:partner_types)
    end
  end
end
