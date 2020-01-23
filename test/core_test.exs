defmodule CoreTest do
  use ExUnit.Case

  alias ExHTTPTest.Core

  test "Load content from .json file" do
    {response, content} = Core.load_content_from_json_file("assets/HTTP_GET.json")

    assert {:ok, true} == {response, is_map(content)}
  end
end
