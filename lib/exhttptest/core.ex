defmodule ExHTTPTest.Core do
  alias ExHTTPTest.Utils
  alias ExHTTPTest.Decoder
  alias ExHTTPTest.Validator
  alias ExHTTPTest.HTTP

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
        {:error, "An URL validation error."}
    end
  end

  def prepare_http_request_args(args), do: args

  def send_http_request({:request, map}) do
    HTTP.method_dispatcher(map)
  end

  def send_http_request(args), do: args

  def extract_http_response({:ok, %HTTPoison.Response{status_code: status_code}, test_name}) do
    [{:test_name, test_name}, {:status_code, status_code}]
  end

  def extract_http_response({:error, %HTTPoison.Error{reason: reason}, test_name}) do
    [{:test_name, test_name}, {:reason, reason}]
  end

  def transform_data_in_tabular_str(data) do
    TableRex.quick_render!([Keyword.values(data)], ["Test name", "HTTP Status Code"])
  end
end
