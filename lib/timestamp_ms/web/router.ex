defmodule TimestampMs.Web.Router do
  use TimestampMs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimestampMs.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:timestamp", TimestampController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimestampMs.Web do
  #   pipe_through :api
  # end
end
