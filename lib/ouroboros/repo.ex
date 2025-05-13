defmodule Ouroboros.Repo do
  use Ecto.Repo,
    otp_app: :ouroboros,
    adapter: Ecto.Adapters.Postgres
end
