defmodule BamboohrBot.MixProject do
  use Mix.Project

  @version "0.0.1-rc.0"
  @elixir "~> 1.11"

  def project do
    [
      app: :bamboohr_bot,
      deps: deps(),
      elixir: @elixir,
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  def application do
    [
      extra_applications: [:logger, :eex],
      mod: {BamboohrBot.Application, []}
    ]
  end

  defp deps do
    [
      {:bamboohr_api, "~> 0.0.1"},
      {:slack, "~> 0.23.5"}
    ]
  end
end
