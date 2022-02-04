defmodule SalactivErp.Repo.Migrations.AddNewFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :mobile, :string
      add :supported_countries, :string
      add :supported_regions, :string
      add :type, :string
    end

    execute "ALTER TABLE users ADD gender ENUM('male', 'female');"
  end
end
