defmodule NashEx.Router do
  use NashEx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NashEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController do
      resources "/comments", CommentController
    end

  end

  # Other scopes may use custom stacks.
  # scope "/api", NashEx do
  #   pipe_through :api
  # end
end
