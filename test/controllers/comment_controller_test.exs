defmodule NashEx.CommentControllerTest do
  use NashEx.ConnCase

  alias NashEx.Comment
  @valid_params comment: %{body: "some content", name: "some content", post_id: 42}
  @invalid_params comment: %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /comments", %{conn: conn} do
    conn = get conn, comment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "GET /comments/:id", %{conn: conn} do
    comment = Repo.insert %Comment{}
    conn = get conn, comment_path(conn, :show, comment)
    assert json_response(conn, 200)["data"] == %{
      "id" => comment.id
    }
  end

  test "POST /comments with valid data", %{conn: conn} do
    conn = post conn, comment_path(conn, :create), @valid_params
    assert json_response(conn, 200)["data"]["id"]
  end

  test "POST /comments with invalid data", %{conn: conn} do
    conn = post conn, comment_path(conn, :create), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "PUT /comments/:id with valid data", %{conn: conn} do
    comment = Repo.insert %Comment{}
    conn = put conn, comment_path(conn, :update, comment), @valid_params
    assert json_response(conn, 200)["data"]["id"]
  end

  test "PUT /comments/:id with invalid data", %{conn: conn} do
    comment = Repo.insert %Comment{}
    conn = put conn, comment_path(conn, :update, comment), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "DELETE /comments/:id", %{conn: conn} do
    comment = Repo.insert %Comment{}
    conn = delete conn, comment_path(conn, :delete, comment)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Comment, comment.id)
  end
end
