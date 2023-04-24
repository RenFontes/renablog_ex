defmodule RenablogEx.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :tags, :string

      timestamps()
    end
  end
end
