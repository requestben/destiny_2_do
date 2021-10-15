defmodule Destiny2Do.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Destiny2Do.Repo,
      # Start the Telemetry supervisor
      Destiny2DoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Destiny2Do.PubSub},
      # Start the Endpoint (http/https)
      Destiny2DoWeb.Endpoint
      # Start a worker by calling: Destiny2Do.Worker.start_link(arg)
      # {Destiny2Do.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Destiny2Do.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Destiny2DoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
