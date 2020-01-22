defmodule UtilsTest do
  use ExUnit.Case

  alias ExHTTPTest.Utils

  test "Does the file extension is supported?" do
    assert Utils.file_ext_supported?("dummy.json") == true
  end

  test "Not supported file extension format" do
    assert Utils.file_ext_supported?("dummy.txt") == false
  end

  test "Reading a .json file" do
    {response, _} = Utils.read_file("assets/HTTP_GET.json")

    assert response == :ok
  end

  test "Reading a .txt file" do
    {response, reason} = Utils.read_file("assets/dummy.txt")

    assert {response, reason} == {:unsupported, :file_ext}
  end

  test "Reading a .json file that doesn't exist" do
    {response, reason} = Utils.read_file("assets/dummy.json")

    assert {response, reason} == {:error, :enoent}
  end
end
