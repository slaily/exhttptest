defmodule ExHTTPTest do
  def execute_single_test_case(file) do
    file
    |> ExHTTPTest.Core.load_content_from_json_file
    |> ExHTTPTest.Core.validate_content
    |> ExHTTPTest.Core.prepare_http_request_args
    |> ExHTTPTest.Core.send_http_request
    |> ExHTTPTest.Core.extract_http_response
    |> ExHTTPTest.Core.transform_data_in_tabular_str
  end
end
