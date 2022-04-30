defmodule TodoAPI.Repo do
  use Ecto.Repo,
    otp_app: :todoAPI,
    adapter: Ecto.Adapters.Postgres
end
