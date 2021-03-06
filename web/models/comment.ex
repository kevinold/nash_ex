defmodule NashEx.Comment do
  use NashEx.Web, :model

  alias NashEx.Post

  schema "comments" do
    field :name, :string
    field :body, :string
    belongs_to :post, Post

    timestamps
  end

  @required_fields ~w(name body post_id)
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
end
