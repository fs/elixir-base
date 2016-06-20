defmodule ElixirBase.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_base,
     version: "0.0.1",
     elixir: "~> 1.2",
     name: "Elixir Base",
     homepage_url: "https://github.com/fs/elixir-base",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     docs: [extras: ["README.md"], output: "./doc/app"],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
     {:exrm, "~> 1.0.5"},
     {:guardsafe, "~> 0.5.0"},
     {:monadex, "~> 1.0.2"},
     {:timex, "~> 2.1.6"},
     {:credo, "~> 0.4", only: [:dev, :test]},
     {:dialyxir, "~> 0.3", only: :dev},
     {:eper, "~> 0.94.0", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:observer_cli, "~> 1.0.5", only: :dev}
   ]
  end
end
