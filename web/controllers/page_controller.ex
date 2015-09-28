defmodule BrycePhoenixTwitter.PageController do
  use BrycePhoenixTwitter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
