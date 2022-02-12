defmodule SalactivErp.Client.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :uuid, :string
    field :type_of_lead, :string
    field :promo_code, :string
    field :company_name, :string
    field :company_email, :string
    field :company_phone, :string
    field :country_id, :integer
    field :referred_by, :integer
    field :created_by, :integer
    field :assigned_to, :integer
    field :partner_id, :integer
    field :wallpost_lead_id, :string
    field :is_client, :integer
    field :company_address, :string
    field :contact_first_name, :string
    field :contact_last_name, :string
    field :contact_email, :string
    field :contact_phone, :string
    field :company_city, :string
    field :company_street, :string
    field :latitude, :string
    field :longitude, :string
    field :location, :string
    field :package, :string

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
    |> validate_company_email()
  end

  defp validate_company_email(changeset) do
    changeset
    |> validate_required([:company_email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:company_email, SalactivErp.Repo)
    |> unique_constraint(:company_email)
  end
end
