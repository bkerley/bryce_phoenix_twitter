defmodule BrycePhoenixTwitter.HomepageController do
  use BrycePhoenixTwitter.Web, :controller

  alias BrycePhoenixTwitter.Status
  import Ecto.Query

  def index(conn, _params) do
    statuses = Repo.all(Status
                        |> order_by([status], desc: status.inserted_at)
    )
    render(conn, "index.html", statuses: statuses)
  end
end
