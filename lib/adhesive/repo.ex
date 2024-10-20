defmodule Adhesive.Repo do
  use Ecto.Repo,
    otp_app: :adhesive,
    adapter: Ecto.Adapters.Postgres
end
