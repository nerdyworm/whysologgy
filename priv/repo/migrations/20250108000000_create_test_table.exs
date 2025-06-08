defmodule Whysologgy.Repo.Migrations.CreateTestTable do
  use Ecto.Migration

  def change do
    create table(:test_vectors) do
      add :name, :string
      add :embedding, :binary  # Will be used to store vector data
      
      timestamps()
    end
  end
end