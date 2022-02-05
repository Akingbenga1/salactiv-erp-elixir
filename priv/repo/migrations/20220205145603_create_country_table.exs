defmodule SalactivErp.Repo.Migrations.CreateCountryTable do
  use Ecto.Migration

  def change do

    create table(:countries) do
      add :name, :string, null: false
      add :region_id, :integer,  default: 1
      add :currency_symbol, :string

      timestamps()
    end
  end
end
