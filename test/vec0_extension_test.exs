defmodule Whysologgy.Vec0ExtensionTest do
  use Whysologgy.DataCase

  @moduledoc """
  This test demonstrates the debug logging issue when loading the vec0.so extension.

  When you run this test, you'll see debug logs from exqlite like:
  - "Loading extension from path: /path/to/vec0.so"
  - Extension loading messages

  The goal is to suppress these debug logs while still successfully loading the extension.
  """

  test "vec0 extension loads successfully" do
    # This query will fail if the vec0 extension is not loaded
    # The vec0 extension provides vector similarity functions
    result = Repo.query!("SELECT vec_version();")

    # vec_version() should return a version string if the extension is loaded
    assert [[version]] = result.rows
    assert is_binary(version)
    IO.puts("vec0 extension version: #{version}")
  end
end
