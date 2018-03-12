defmodule MikeCheckTest do
  use ExUnit.Case
  doctest MikeCheck

  test "greets the world" do
    assert MikeCheck.hello() == :world
  end
end
