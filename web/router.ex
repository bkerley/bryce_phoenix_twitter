defmodule BrycePhoenixTwitter.Router do
  use BrycePhoenixTwitter.Web, :router

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

  scope "/", BrycePhoenixTwitter do
    pipe_through :browser # Use the default browser stack

    get "/", HomepageController, :index

    resources "/statuses", StatusController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrycePhoenixTwitter do
  #   pipe_through :api
  # end
end
