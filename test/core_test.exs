defmodule CoreTest do
  use ExUnit.Case

  alias ExHTTPTest.Core

  test "Load content from .json file" do
    {response, content} = Core.load_content_from_json_file("assets/HTTP_GET.json")

    assert {:ok, true} == {response, is_map(content)}
  end

  test "Does the content is valid under specific conditions?" do
    content = %{
      "endpoint" => "users",
      "headers" => %{"Accept-Language" => "en-US"},
      "host" => "http://localhost:8080",
      "name" => "TEST: List all users",
      "query_string" => %{"limit" => 5},
      "verb" => "GET"
    }
    {response, _} = Core.validate_content({:ok, content})

    assert response == :valid
  end

  test "Prepare arguments for an HTTP Request" do
    args = %{
      "endpoint" => "users",
      "headers" => %{"Accept-Language" => "en-US"},
      "host" => "http://localhost:8080",
      "name" => "TEST: List all users",
      "query_string" => %{"limit" => 5},
      "verb" => "GET"
    }
    {_, http_request_map} = Core.prepare_http_request_args({:valid, args})

    assert Map.has_key?(http_request_map, :url)
  end

  test "Send an HTTP Request, which is not supported" do
    {response, _} = Core.send_http_request({:request, %{:verb => "HEAD"}})

    assert response == :unsupported
  end
end
