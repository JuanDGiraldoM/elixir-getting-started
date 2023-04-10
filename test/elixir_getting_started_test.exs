defmodule ElixirGettingStartedTest do
  use ExUnit.Case
  doctest ElixirGettingStarted

  test "greets the world" do
    assert ElixirGettingStarted.hello() == :world
  end
end
