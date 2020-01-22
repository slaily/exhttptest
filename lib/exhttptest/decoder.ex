defmodule ExHTTPTest.Decoder do
  def decode_content_from_json_file({:ok, content}), do: Jason.decode(~s(#{content}))

  def decode_content_from_json_file(args), do: args
end
