defmodule ExHTTPTestTest do
  use ExUnit.Case
  doctest ExHTTPTest

  test "execute the test cases" do
    assert ExHTTPTest.execute() == :executing
  end
end
