defmodule BamboohrBot do
  @moduledoc """
  Documentation for `BamboohrBot`.
  """

  use Slack

  ## API

  def send_pto_message(date \\ Date.utc_today(), channel \\ nil) do
    message = generate_pto_message(date)

    channel = channel || __MODULE__.Config.channel()

    send(__MODULE__, {:message, message, channel})
  end

  defp generate_pto_message(date) do
    date
    |> BamboohrBot.PTOFinder.people_on_pto()
    |> pto_message()
  end

  defp pto_message(people) do
    __MODULE__.Config.pto_message_eex()
    |> EEx.eval_file(people: people)
  end

  ## BOT Behaviour

  def handle_connect(_slack, state) do
    {:ok, state}
  end

  def handle_event(_, _, state), do: {:ok, state}

  def handle_info({:message, text, channel}, slack, state) do
    send_message(text, channel, slack)
    {:ok, state}
  end

  defmodule Config do
    @moduledoc """
    Configuration module for BambooHR Bot
    """

    def slack_bot_token do
      :bamboohr_bot
      |> Application.get_env(__MODULE__)
      |> Keyword.fetch!(:token)
    end

    def channel do
      :bamboohr_bot
      |> Application.get_env(__MODULE__)
      |> Keyword.fetch!(:channel)
    end

    def pto_message_eex do
      :bamboohr_bot
      |> Application.get_env(__MODULE__)
      |> Keyword.fetch!(:pto_message_eex)
    end
  end
end
