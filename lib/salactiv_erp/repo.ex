defmodule SalactivErp.Repo do
  use Ecto.Repo,
    otp_app: :salactiv_erp,
    adapter: Ecto.Adapters.MyXQL
end
