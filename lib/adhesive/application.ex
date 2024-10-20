defmodule Adhesive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AdhesiveWeb.Telemetry,
      Adhesive.Repo,
      {DNSCluster, query: Application.get_env(:adhesive, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Adhesive.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Adhesive.Finch},
      # Start a worker by calling: Adhesive.Worker.start_link(arg)
      # {Adhesive.Worker, arg},
      # Start to serve requests, typically the last entry
      AdhesiveWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Adhesive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AdhesiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
