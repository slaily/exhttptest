defmodule Test.HTTPSchema.Get do
  use ExUnit.Case

  alias ExHTTPTest.HTTPSchema.Get

  test "Extract an HTTP GET Request JSON Schema" do
    json_schema_struct = Get.json_schema()

    assert is_map(json_schema_struct.schema)
  end
end
