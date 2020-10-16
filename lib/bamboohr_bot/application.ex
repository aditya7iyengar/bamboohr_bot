defmodule BamboohrBot.Application do
  @moduledoc false

  use Application
  import Supervisor.Spec, warn: false

  @impl true
  def start(_type, _args) do
    children = [
      worker(
        Slack.Bot,
        [
          BamboohrBot,
          [],
          BamboohrBot.Config.slack_bot_token(),
          [name: BamboohrBot]
        ]
      )
    ]

    opts = [strategy: :one_for_one, name: BamboohrBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
