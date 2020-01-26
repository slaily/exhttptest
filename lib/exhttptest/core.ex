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
      |> String.upcase()
      |> String.to_atom()
      |> Validator.validate_data_against_json_schema(content)

    case validation_response do
      :ok ->
        {:valid, content}
      {:error, reason} ->
        {:invalid, reason}
    end
  end

  def validate_content(args), do: args

  def prepare_http_request_args({:valid, content}) do
    response = Utils.prepare_url(
      Map.get(content, "host"),
      Map.get(content, "endpoint")
    ) |> Utils.validate_uri

    case response do
      {:ok, url} ->
        Map.put(content, "url", url) |> Utils.construct_http_request_map()
      {:error, _} ->
        nil
    end
  end

  def prepare_http_request_args(args), do: args
end
