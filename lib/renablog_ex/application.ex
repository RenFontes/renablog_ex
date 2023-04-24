defmodule RenablogEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RenablogExWeb.Telemetry,
      # Start the Ecto repository
      RenablogEx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: RenablogEx.PubSub},
      # Start Finch
      {Finch, name: RenablogEx.Finch},
      # Start the Endpoint (http/https)
      RenablogExWeb.Endpoint
      # Start a worker by calling: RenablogEx.Worker.start_link(arg)
      # {RenablogEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RenablogEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RenablogExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
