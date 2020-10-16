use Mix.Config

config :bamboohr_api, BamboohrApi.Config,
  subdomain: "hogwarts",
  api_key: "caput-draconis",
  api_version: "v1"

config :bamboohr_bot, BamboohrBot.Config,
  token: "xoxb-temp-token",
  channel: "C01XX897X"
