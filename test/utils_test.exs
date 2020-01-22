defmodule UtilsTest do
  use ExUnit.Case

  alias ExHTTPTest.Utils

  test "Does the file extension is supported?" do
    assert Utils.file_ext_supported?("dummy.json") == true
  end

  test "Not supported file extension format" do
    assert Utils.file_ext_supported?("dummy.txt") == false
  end
end
