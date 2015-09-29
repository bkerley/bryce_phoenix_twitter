defmodule BrycePhoenixTwitter.HomepageController do
  use BrycePhoenixTwitter.Web, :controller

  alias BrycePhoenixTwitter.Status
  import Ecto.Query

  def index(conn, _params) do
    statuses = Repo.all(Status
                        |> order_by([status], desc: status.inserted_at)
    )
    new_status = Status.changeset(%Status{})
    render(conn, "index.html", statuses: statuses, new_status: new_status)
  end
end
