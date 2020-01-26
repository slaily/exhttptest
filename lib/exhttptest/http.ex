defmodule ExHTTPTest.HTTP do
  def method_dispatcher(request_map) when is_map(request_map) do
    IO.puts request_map.verb not in []
    if request_map.verb not in [] do
      {:unsupported, "An HTTP method is not supported."}
    else
      request(request_map)
    end
  end

  defp request(%{:verb => "GET", :url => url, :headers => headers, :query_string => query_params}) do
    HTTPoison.get(url, headers, params: query_params)
  end
end
