# Whysologgy - Minimal vec0.so Extension Loading Example

This is a minimal Elixir application that demonstrates the debug logging issue when loading SQLite extensions (specifically vec0.so) through exqlite/ecto_sqlite3.

## Problem Description

When loading SQLite extensions via the `load_extensions` configuration in ecto_sqlite3, debug logs are printed to the console even when the Logger level is set to `:info` or higher. This creates unwanted noise in production logs.

## Setup

1. Install dependencies:
   ```bash
   mix deps.get
   ```

3. Create and migrate the database:
   ```bash
   mix ecto.create
   mix ecto.migrate
   ```

## Running the Test

To see the debug logging issue, run:
```bash
mix test
```

You'll see debug logs like:
- "Loading extension from path: /path/to/vec0.so"
- Other extension loading messages

These logs appear even though our logger is configured for `:info` level (matching the configuration in the parent inbot project).

## Key Files

- `config/runtime.exs` - Contains the `load_extensions` configuration that triggers the debug logs
- `test/vec0_extension_test.exs` - Tests that demonstrate the extension is loaded and working
- `lib/whysologgy/repo.ex` - Basic Ecto repo setup with SQLite3 adapter

## Expected Behavior

The vec0 extension should load silently without debug logs when the logger level is set to `:info` or higher.

## Current Behavior

Debug logs are printed regardless of the logger level setting, creating noise in production environments.

## Configuration

The extension is loaded via:
```elixir
config :whysologgy, Whysologgy.Repo, 
  load_extensions: ["#{:code.priv_dir(:whysologgy)}/vec0.so"]
```

This configuration is in `config/runtime.exs` to ensure it runs after compilation. The vec0.so file is included in the `priv/` directory of this example project.