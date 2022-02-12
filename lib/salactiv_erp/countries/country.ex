defmodule SalactivErp.Country.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    field :region_id, :integer
    field :currency_symbol, :string

    timestamps()
  end


  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :region_id, :currency_symbol  ])
    |> validate_required([:name, :region_id ])
  end
end
