defmodule Ouroboros.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OuroborosWeb.Telemetry,
      Ouroboros.Repo,
      {DNSCluster, query: Application.get_env(:ouroboros, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ouroboros.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ouroboros.Finch},
      # Start a worker by calling: Ouroboros.Worker.start_link(arg)
      # {Ouroboros.Worker, arg},
      # Start to serve requests, typically the last entry
      OuroborosWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ouroboros.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OuroborosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
