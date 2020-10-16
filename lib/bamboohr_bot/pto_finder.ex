defmodule BamboohrBot.PTOFinder do
  @moduledoc """
  Uses BambooHR API Client to find people on PTO today
  """

  def people_on_pto(date) do
    %{start: date, end: date}
    |> BamboohrApi.Entity.TimeOffRequest.list(config())
    |> Enum.map(& &1.name)
    |> Enum.uniq()
  end

  defp config do
    BamboohrApi.Config.default()
  end
end
