defmodule TimestampMs.Web.TimestampController do
  use TimestampMs.Web, :controller
  alias TimestampMs.Timestamp

  def index(conn, params) do
    json conn, Timestamp.parse_timestamp(params["timestamp"])
  end
end