defmodule Whysologgy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.inspect(Logger.level(), label: "Logger global level (application)")
    Logger.metadata() |> IO.inspect(label: "Logger metadata (application)")

    children = [
      # Start the Ecto repository
      Whysologgy.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Whysologgy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
