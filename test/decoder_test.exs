defmodule DecoderTest do
  use ExUnit.Case

  alias ExHTTPTest.Decoder

  test "Decode content from a .json file" do
    # The passed tuple as a function argument simulates File.read(...)
    {:ok, content} = Decoder.decode_content_from_json_file(
      {:ok, ~s({"key": "value"})}
    )

    assert is_map(content)
  end

  test "Try to decode broken content from a .json file" do
    # The passed tuple as a function argument simulates File.read(...)
    {response, cnt} = Decoder.decode_content_from_json_file(
      {:ok, ~s({"key"; "value"})}
    )

    assert response == :error
  end

  test "Not suitable function arguments for decode" do
    # The passed tuple as a function argument simulates File.read(...)
    # with an error returned
    {response, _} = Decoder.decode_content_from_json_file(
      {:error, :enoent}
    )

    assert response == :error
  end
end
