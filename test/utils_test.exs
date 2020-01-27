defmodule UtilsTest do
  use ExUnit.Case

  alias ExHTTPTest.Utils

  test "Does the file extension is supported?" do
    assert Utils.file_ext_supported?("dummy.json") == true
  end

  test "Not supported file extension format" do
    assert Utils.file_ext_supported?("dummy.txt") == false
  end

  test "Reading a .json file" do
    {response, _} = Utils.read_file("assets/HTTP_GET.json")

    assert response == :ok
  end

  test "Reading a .txt file" do
    {response, reason} = Utils.read_file("assets/dummy.txt")

    assert {response, reason} == {:unsupported, :file_ext}
  end

  test "Reading a .json file that doesn't exist" do
    {response, reason} = Utils.read_file("assets/dummy.json")

    assert {response, reason} == {:error, :enoent}
  end

  test "Prepare an URL by providing the host and endpoint" do
    url = Utils.prepare_url("http://localhost:8080", "/users")

    assert url == "http://localhost:8080/users"
  end

  test "Does the URI is valid?" do
    {response, _} = Utils.validate_uri("localhost:8080/users")

    assert response == :error
  end

  test "Construct map with arguments for an HTTP Request" do
    map = %{
      "endpoint" => "users",
      "headers" => %{"Accept-Language" => "en-US"},
      "host" => "http://localhost:8080",
      "name" => "TEST: List all users",
      "query_string" => %{"limit" => 5},
      "verb" => "GET"
    }

    {_, new_map} = Utils.construct_http_request_map(map)

    assert Map.has_key?(new_map, :verb)
  end
end
