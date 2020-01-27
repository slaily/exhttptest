defmodule ExHTTPTest.Utils do
  def file_ext_supported?(file) do
    Path.extname(file) in [".json"]
  end

  def read_file(file) do
    case file_ext_supported?(file) do
      true -> File.read(file)
      false -> {:unsupported, :file_ext}
    end
  end

  def prepare_url(host, endpoint) do
    cond do
      host == "" ->
        nil
      String.last(host) != "/" and String.first(endpoint) != "/" ->
        "#{host}/#{endpoint}"
      String.last(host) == "/" and String.first(endpoint) != "/" ->
        host <> endpoint
      String.last(host) != "/" and String.first(endpoint) == "/" ->
        host <> endpoint
      String.last(host) == "/" and String.first(endpoint) == "/" ->
        host <> String.slice(endpoint, 1..-1)
      true ->
        nil
    end
  end

  def validate_uri(uri) do
    parsed_uri = URI.parse(uri)

    case parsed_uri do
      %URI{scheme: nil} -> {:error, uri}
      %URI{host: nil} -> {:error, uri}
      %URI{path: nil} -> {:error, uri}
      _ -> {:ok, uri}
    end
  end

  def construct_http_request_map(map) when is_map(map) do
    new_map =
      map
      |> Map.drop(["host", "endpoint"])
      |> Map.new(fn {key, value} -> {String.to_atom(key), value} end)

    {:request, new_map}
  end
end
