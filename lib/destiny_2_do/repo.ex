defmodule Destiny2Do.Repo do
  use Ecto.Repo,
    otp_app: :destiny_2_do,
    adapter: Ecto.Adapters.Postgres
end
