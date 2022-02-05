defmodule SalactivErp.Repo.Migrations.CreatePartnerTypeTable do
  use Ecto.Migration

  def change do
    create table(:partners) do
      add :name, :string, null: false
      add :commission, :string
      timestamps()
    end
  end
end
