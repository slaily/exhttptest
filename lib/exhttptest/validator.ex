defmodule ExHTTPTest.Validator do
  alias ExHTTPTest.HTTPSchema.{Get}

  def validate_data_against_json_schema(:GET, data) when is_map(data) do
    Get.json_schema |> ExJsonSchema.Validator.validate(data)
  end

  def validate_data_against_json_schema(:NIL, _) do
    {:error, "Required property verb was not present."}
  end

  def validate_data_against_json_schema(_, _) do
    {:error, "The provided verb is not supported."}
  end
end
