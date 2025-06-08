import Config

# Configure your database
config :whysologgy, Whysologgy.Repo,
  database: Path.expand("../whysologgy_dev.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

# Do not include metadata nor timestamps in development logs
config :logger, :default_formatter, format: "[$level] $message\n"
config :logger, level: :info
config :logger, truncate: :infinity
config :logger, :console, truncate: :infinity
