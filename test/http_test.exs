defmodule HTTPTest do
  use ExUnit.Case

  alias ExHTTPTest.HTTP

  test "Dispatching an HTTP Request to the appropriate handler" do
    {response, _} = HTTP.method_dispatcher(%{:verb => "HEAD"})

    assert response == :unsupported
  end
end
