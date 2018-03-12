defmodule ProfilingTest do
  use ExUnit.Case
  doctest Profiling

  test "greets the world" do
    assert Profiling.hello() == :world
  end
end
