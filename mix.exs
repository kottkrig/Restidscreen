defmodule Restid.MixProject do
  use Mix.Project

  def project do
    [
      app: :restid,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      env: [
        vasttrafik_key: "OfOgXW0iWyYRMNKXMlV1h5ypKz4a",
        vasttrafik_secret: "dX0zOV8UenVNRy567tBtL1oKApQa"
      ],
      mod: {Restid.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 0.8"},
      {:poison, ">= 1.0.0"}
    ]
  end
end
