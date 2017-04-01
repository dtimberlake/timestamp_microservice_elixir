defmodule TimestampMs.Web.PageController do
  use TimestampMs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
