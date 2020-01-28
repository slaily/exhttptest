defmodule ExHTTPTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :exhttptest,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      escript: escript_config(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :table_rex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:ex_json_schema, "~> 0.7.3"},
      {:httpoison, "~> 1.6"},
      {:table_rex, "~> 2.0"}
    ]
  end

  defp escript_config do
    [main_module: CLI]
  end
end
