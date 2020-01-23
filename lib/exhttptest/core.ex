defmodule ExHTTPTest.Core do
  alias ExHTTPTest.Utils
  alias ExHTTPTest.Decoder

  def load_content_from_json_file(file_path) do
    file_path
      |> Utils.read_file
      |> Decoder.decode_content_from_json_file
  end
end
