defmodule Whysologgy.Repo do
  use Ecto.Repo,
    otp_app: :whysologgy,
    adapter: Ecto.Adapters.SQLite3
end
