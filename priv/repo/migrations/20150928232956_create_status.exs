defmodule BrycePhoenixTwitter.Repo.Migrations.CreateStatus do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :body, :string

      timestamps
    end

  end
end
