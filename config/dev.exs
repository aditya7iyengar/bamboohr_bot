use Mix.Config

config :bamboohr_api, BamboohrApi.Config,
  subdomain: System.get_env("BAMBOO_SUBDOMAIN"),
  api_key: System.get_env("BAMBOO_API_KEY"),
  api_version: System.get_env("BAMBOO_API_VERSION")

config :bamboohr_bot, BamboohrBot.Config,
  token: System.get_env("SLACK_BOT_TOKEN"),
  channel: System.get_env("SLACK_BOT_CHANNEL"),
  pto_message_eex:
    Path.join([
      "./priv",
      "messages",
      "pto.eex"
    ])
