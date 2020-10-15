defmodule BamboohrBot.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BamboohrBot.Worker.start_link(arg)
      # {BamboohrBot.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: BamboohrBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
