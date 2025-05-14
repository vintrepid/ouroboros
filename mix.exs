defmodule Ouroboros.MixProject do
  use Mix.Project

  def project do
    [
      app: :ouroboros,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
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
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # Phoenix and liveview
      {:phoenix, "~> 1.7.11"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.2"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.3"},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.1.1",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},

      # Email
      {:swoosh, "~> 1.5"},
      {:finch, "~> 0.13"},

      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.1.1"},
      {:bandit, "~> 1.2"},

      {:plug_cowboy, "~> 2.7"},

      # Dev & tooling
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.18", only: :test},

      # Authentication & authz
      {:bodyguard, "~> 2.4"},
      # cancan

      # Livebook (latest, GitHub tag)
      # {:livebook, github: "livebook-dev/livebook", tag: "v0.15.5", only: :dev},

      # A/B testing & feature flags
      # {:fun_with_flags, "~> 1.13"},

      # Monitoring & error tracking
      # {:sentry, "~> 10.9"},
      # {:honeybadger, "~> 0.24"},
      # {:appsignal, "~> 2.15"},

      # Background jobs
      {:oban, "~> 2.19"},

      # CMS, Admin, UI (commented for now)
      # {:petal_admin, "~> 0.6"},
      # {:beacon, "~> 0.1.11"},

      # Data tools
      {:flop, "~> 0.26"},
      {:flop_phoenix, "~> 0.22"},
      {:vega_lite, "~> 0.1"},
      {:timex, "~> 3.7"}
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
