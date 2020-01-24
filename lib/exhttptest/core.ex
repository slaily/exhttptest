defmodule ExHTTPTest.Core do
  alias ExHTTPTest.Utils
  alias ExHTTPTest.Decoder
  alias ExHTTPTest.Validator

  def load_content_from_json_file(file_path) do
    file_path
      |> Utils.read_file
      |> Decoder.decode_content_from_json_file
  end

  def validate_content({:ok, content}) do
    validation_response = Map.get(content, "verb", "nil")
      |> String.upcase
      |> String.to_atom
      |> Validator.validate_data_against_json_schema(content)

    case validation_response do
      :ok ->
        {:valid, content}
      {:error, reason} ->
        {:invalid, reason}
    end
  end

  def validate_content(args), do: args
end
