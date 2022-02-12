# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SalactivErp.Repo.insert!(%SalactivErp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias SalactivErp.SeedHelpers.CountrySeeder
json_file = "#{__DIR__}/seeds/country-by-continent.json"

with {:ok, body} <- File.read(json_file),
     {:ok, json} <- Jason.decode(body, keys: :atoms) do
      IO.inspect "++++++++++Seeder JSon ++++++++++++++++"
      [good | _tail] = json
      IO.inspect good
  # insert to db

      Enum.each(json, fn item ->  CountrySeeder.insertCountries(item) end)
else
  err ->
    IO.inspect(err)
end
