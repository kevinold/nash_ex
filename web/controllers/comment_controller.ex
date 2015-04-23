defmodule NashEx.CommentController do
  use NashEx.Web, :controller

  alias NashEx.Comment

  plug :scrub_params, "comment" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    comments = Repo.all(Comment)
    render(conn, "index.json", comments: comments)
  end

  def create(conn, %{"comment" => comment_params}) do
    changeset = Comment.changeset(%Comment{}, comment_params)

    if changeset.valid? do
      comment = Repo.insert(changeset)
      render(conn, "show.json", comment: comment)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(NashEx.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Repo.get(Comment, id)
    render conn, "show.json", comment: comment
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Repo.get(Comment, id)
    changeset = Comment.changeset(comment, comment_params)

    if changeset.valid? do
      comment = Repo.update(changeset)
      render(conn, "show.json", comment: comment)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(NashEx.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Repo.get(Comment, id)

    comment = Repo.delete(comment)
    render(conn, "show.json", comment: comment)
  end
end
