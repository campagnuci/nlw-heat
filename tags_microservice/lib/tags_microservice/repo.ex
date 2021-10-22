defmodule TagsMicroservice.Repo do
  use Ecto.Repo,
    otp_app: :tags_microservice,
    adapter: Ecto.Adapters.Postgres
end
