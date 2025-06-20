import Config


config :logger, level: :info
config :logger, :console, level: :info
config :logger, :default_handler, level: :info

IO.puts("HI")

