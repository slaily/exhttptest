defmodule ExHTTPTest.Utils do
  def file_ext_supported?(file) do
    Path.extname(file) in [".json"]
  end
end
