defmodule BamboohrBotTest do
  use ExUnit.Case
  doctest BamboohrBot

  test "greets the world" do
    assert BamboohrBot.hello() == :world
  end
end
