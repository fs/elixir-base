defmodule ElixirBase.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_base,
      version: "0.0.1",
      elixir: "~> 1.4",
      name: "Elixir Base",
      homepage_url: "https://github.com/fs/elixir-base",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      escript: [main_module: ElixirBase.CLI],
      docs: [extras: ["README.md"], output: "./doc/app"],
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: ~w(erlexec effects guardsafe monadex timex)a,
     mod: {ElixirBase, []},
     elixirc_paths: elixirc_paths(Mix.env)]
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(:test), do: ~w(lib web test/support)
  defp elixirc_paths(_), do: ~w(lib web)

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
     {:erlexec, "~> 1.2.1"},
     {:exrm, "~> 1.0.5"},
     {:effects, "~> 0.1.0"},
     {:guardsafe, "~> 0.5.0"},
     {:monadex, "~> 1.0.2"},
     {:ok, "~> 1.0.0"},
     {:logger_file_backend, "~> 0.0.9"},
     {:progress_bar, "> 0.0.0"},
     {:table_rex, "~> 0.8.0"},
     {:timex, "~> 3.0"},
     {:credo, "~> 0.4", only: ~w(dev test)a},
     {:dialyxir, "~> 0.3", only: :dev},
     {:edeliver, ">= 1.2.9", only: :dev},
     {:eper, "~> 0.94.0", only: :dev},
     {:ex_machina, "~> 0.6.1", only: ~w(dev test)a},
     {:ex_doc, "~> 0.11", only: :dev},
     {:observer_cli, "~> 1.0.5", only: :dev},
     {:espec, "~> 1.1.0", only: :test},
     {:faker, "~> 0.5", only: :test,}
   ]
  end
end
