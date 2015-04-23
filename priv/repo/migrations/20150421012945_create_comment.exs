defmodule NashEx.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :name, :string
      add :body, :text
      add :post_id, :integer

      timestamps
    end
  end
end
