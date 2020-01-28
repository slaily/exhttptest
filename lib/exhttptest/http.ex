defmodule ExHTTPTest.HTTP do
  def method_dispatcher(request_map) when is_map(request_map) do
    if request_map.verb not in ["GET"] do
      {:unsupported, "An HTTP method is not supported."}
    else
      request(request_map)
    end
  end

  defp request(%{:verb => "GET", :url => url, :headers => headers, :query_string => query_params, :name => test_name}) do
    response = HTTPoison.get(url, headers, params: query_params)

    Tuple.append(response, test_name)
  end
end
