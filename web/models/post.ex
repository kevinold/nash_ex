defmodule NashEx.Post do
  use NashEx.Web, :model

  alias NashEx.Comment
  alias NashEx.Post

  schema "posts" do
    field :title, :string
    field :body, :string
    has_many :comments, Comment

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def get_with_comments(id) do
    Post
    |> preload(:comments)
    |> NashEx.Repo.get(id)
  end
end
