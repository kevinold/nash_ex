defmodule NashEx.PostControllerTest do
  use NashEx.ConnCase

  alias NashEx.Post
  @valid_params post: %{body: "some content", title: "some content"}
  @invalid_params post: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /posts", %{conn: conn} do
    conn = get conn, post_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing posts"
  end

  test "GET /posts/new", %{conn: conn} do
    conn = get conn, post_path(conn, :new)
    assert html_response(conn, 200) =~ "New post"
  end

  test "POST /posts with valid data", %{conn: conn} do
    conn = post conn, post_path(conn, :create), @valid_params
    assert redirected_to(conn) == post_path(conn, :index)
  end

  test "POST /posts with invalid data", %{conn: conn} do
    conn = post conn, post_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New post"
  end

  test "GET /posts/:id", %{conn: conn} do
    post = Repo.insert %Post{}
    conn = get conn, post_path(conn, :show, post)
    assert html_response(conn, 200) =~ "Show post"
  end

  test "GET /posts/:id/edit", %{conn: conn} do
    post = Repo.insert %Post{}
    conn = get conn, post_path(conn, :edit, post)
    assert html_response(conn, 200) =~ "Edit post"
  end

  test "PUT /posts/:id with valid data", %{conn: conn} do
    post = Repo.insert %Post{}
    conn = put conn, post_path(conn, :update, post), @valid_params
    assert redirected_to(conn) == post_path(conn, :index)
  end

  test "PUT /posts/:id with invalid data", %{conn: conn} do
    post = Repo.insert %Post{}
    conn = put conn, post_path(conn, :update, post), @invalid_params
    assert html_response(conn, 200) =~ "Edit post"
  end

  test "DELETE /posts/:id", %{conn: conn} do
    post = Repo.insert %Post{}
    conn = delete conn, post_path(conn, :delete, post)
    assert redirected_to(conn) == post_path(conn, :index)
    refute Repo.get(Post, post.id)
  end
end
