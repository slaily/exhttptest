defmodule ExhttptestTest do
  use ExUnit.Case
  doctest Exhttptest

  test "execute the test cases" do
    assert Exhttptest.execute() == :executing
  end
end
