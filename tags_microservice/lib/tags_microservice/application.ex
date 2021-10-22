defmodule TagsMicroservice.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TagsMicroservice.Repo,
      # Start the Telemetry supervisor
      TagsMicroserviceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TagsMicroservice.PubSub},
      # Start the Endpoint (http/https)
      TagsMicroserviceWeb.Endpoint,
      # Start a worker by calling: TagsMicroservice.Worker.start_link(arg)
      # {TagsMicroservice.Worker, arg}
      TagsMicroservice.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TagsMicroservice.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TagsMicroserviceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
