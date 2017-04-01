defmodule TimestampMs.Repo.Migrations.CreateTimestampMs.Timestamp.Timestamped do
  use Ecto.Migration

  def change do
    create table(:timestamp_timestamps) do
      add :natural, :string

      timestamps()
    end

  end
end
