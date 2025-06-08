import Config

# Load SQLite vector extension
# This is the key configuration that demonstrates the debug logging issue
config :whysologgy, Whysologgy.Repo, load_extensions: ["#{:code.priv_dir(:whysologgy)}/vec0.so"]
