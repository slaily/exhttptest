defmodule ExHTTPTest.HTTP do
  def method_dispatcher(request_map) when is_map(request_map) do
    IO.puts request_map.verb not in []
    if request_map.verb not in [] do
      {:unsupported, "An HTTP method is not supported."}
    else
      request(request_map)
    end
  end

  def request(args), do: nil
end
