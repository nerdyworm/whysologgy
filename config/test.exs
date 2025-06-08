import Config

# Configure your database
config :whysologgy, Whysologgy.Repo,
  database: Path.expand("../whysologgy_test.db", Path.dirname(__ENV__.file)),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 5

# Configure logger for test environment (same as dev)
config :logger, :default_formatter, format: "[$level] $message\n"
config :logger, level: :info
config :logger, truncate: :infinity
config :logger, :console, truncate: :infinity
