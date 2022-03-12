defmodule Freestyle.Repo do
  use Ecto.Repo,
    otp_app: :freestyle,
    adapter: Ecto.Adapters.Postgres
end
