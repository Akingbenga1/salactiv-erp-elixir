defmodule SalactivErp.SeedHelpers.CountrySeeder do
  @moduledoc """
    Provides methods for seeding country data
  """

  alias SalactivErp.Repo

  alias SalactivErp.Country.Country


  def insertCountries(countryData) do
    if countryData do

      countryInsertData = %Country{ :name =>  countryData.country, :region_id =>  "1", :currency_symbol =>  nil}

      Repo.insert!(countryInsertData)
    end
  end

end
