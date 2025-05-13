defmodule Ouroboros.MixProject do
  use Mix.Project

  def project do
    [
      app: :ouroboros,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.github": :test
      ]
    ]
  end

  def application do
    [
      mod: {Ouroboros.Application, []},
      extra_applications: [:logger, :runtime_tools, :os_mon]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:phoenix, ">= 0.0.0"}, #~> 1.7.11"},
      {:phoenix_ecto, ">= 0.0.0"}, #~> 4.4"},
      {:ecto_sql, ">= 0.0.0"}, #~> 3.10"},
      {:postgrex, ">= 0.0.0"}, #>= 0.0.0"},
      {:phoenix_live_view, ">= 0.0.0"}, #~> 0.20.2"},
      {:phoenix_html, ">= 0.0.0"}, #~> 4.0"},
      {:phoenix_live_reload, ">= 0.0.0"}, #~> 1.4", only: :dev},
      {:phoenix_live_dashboard, ">= 0.0.0"}, #~> 0.8.3"},
      {:telemetry_metrics, ">= 0.0.0"}, #~> 1.0"},
      {:telemetry_poller, ">= 0.0.0"}, #~> 1.1.0"},
      {:gettext, ">= 0.0.0"}, #~> 0.23"},
      {:jason, ">= 0.0.0"}, #~> 1.4"},
      {:plug_cowboy, ">= 0.0.0"}, #~> 2.7"},
      {:plug_crypto, ">= 0.0.0"}, #~> 2.1.0"},
      # {:phx_gen_auth, github: "phoenixframework/phx_gen_auth", only: [:dev], runtime: false},
      {:bodyguard, ">= 0.0.0"}, #~> 2.4"},
      {:livebook, ">= 0.0.0"}, #~> 0.12.3", only: :dev},
      {:fun_with_flags, ">= 0.0.0"}, #~> 1.8"},
      # {:petal_admin, ">= 0.0.0"}, #~> 0.6"},
      {:sentry, ">= 0.0.0"}, #~> 9.1"},
      {:honeybadger, ">= 0.0.0"}, #~> 0.17"},
      {:appsignal, ">= 0.0.0"}, #~> 2.7"},
      # {:beacon, ">= 0.0.0"}, #~> 0.1.11"},
      {:credo, ">= 0.0.0"}, #~> 1.7", only: [:dev, :test], runtime: false},
      {:oban, ">= 0.0.0"}, #~> 2.17"},
      {:swoosh, ">= 0.0.0"}, #~> 1.5"},
      {:finch, ">= 0.0.0"}, #~> 0.16"},
      {:flop, ">= 0.0.0"}, #~> 0.22"},
      {:flop_phoenix, ">= 0.0.0"}, #~> 0.20"},
      {:vega_lite, ">= 0.0.0"}, #~> 0.1"},
      {:timex, ">= 0.0.0"}, #~> 3.7"},
      {:esbuild, ">= 0.0.0"}, #~> 0.7", runtime: Mix.env() == :dev},
      {:tailwind, ">= 0.0.0"}, #~> 0.2", runtime: Mix.env() == :dev},
      {:excoveralls, ">= 0.0.0"}, #~> 0.18", only: :test}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end