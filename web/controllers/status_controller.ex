defmodule BrycePhoenixTwitter.StatusController do
  use BrycePhoenixTwitter.Web, :controller

  alias BrycePhoenixTwitter.Status

  plug :scrub_params, "status" when action in [:create, :update]

  def index(conn, _params) do
    statuses = Repo.all(Status)
    render(conn, "index.html", statuses: statuses)
  end

  def new(conn, _params) do
    changeset = Status.changeset(%Status{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"status" => status_params}) do
    changeset = Status.changeset(%Status{}, status_params)

    case Repo.insert(changeset) do
      {:ok, _status} ->
        conn
        |> put_flash(:info, "Status created successfully.")
        |> redirect(to: status_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    status = Repo.get!(Status, id)
    render(conn, "show.html", status: status)
  end

  def edit(conn, %{"id" => id}) do
    status = Repo.get!(Status, id)
    changeset = Status.changeset(status)
    render(conn, "edit.html", status: status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "status" => status_params}) do
    status = Repo.get!(Status, id)
    changeset = Status.changeset(status, status_params)

    case Repo.update(changeset) do
      {:ok, status} ->
        conn
        |> put_flash(:info, "Status updated successfully.")
        |> redirect(to: status_path(conn, :show, status))
      {:error, changeset} ->
        render(conn, "edit.html", status: status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    status = Repo.get!(Status, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(status)

    conn
    |> put_flash(:info, "Status deleted successfully.")
    |> redirect(to: status_path(conn, :index))
  end
end
