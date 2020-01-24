defmodule ValidatorTest do
  use ExUnit.Case

  alias ExHTTPTest.Validator

  test "Data against specific JSON Schema" do
    data = %{
      "endpoint" => "users",
      "headers" => %{"Accept-Language" => "en-US"},
      "host" => "http://localhost:8080",
      "name" => "TEST: List all users",
      "query_string" => %{"limit" => 5},
      "verb" => "GET"
    }
    status = Validator.validate_data_against_json_schema(:GET, data)

    assert status == :ok
  end
end
