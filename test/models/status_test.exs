defmodule BrycePhoenixTwitter.StatusTest do
  use BrycePhoenixTwitter.ModelCase

  alias BrycePhoenixTwitter.Status

  @valid_attrs %{body: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Status.changeset(%Status{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Status.changeset(%Status{}, @invalid_attrs)
    refute changeset.valid?
  end
end
