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
end
