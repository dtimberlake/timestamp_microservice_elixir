defmodule TimestampMs.Web.TimestampeControllerTest do
  use TimestampMs.Web.ConnCase

  test "pass unix time", %{conn: conn} do
    conn = get conn, timestamp_path(conn, :index, "1450137600")
    response = json_response(conn, 200)
  
    assert response["unix"] == 1450137600
    assert response["natural"] == "December 15, 2015"
  end

  test "pass natural time", %{conn: conn} do
    conn = get conn, timestamp_path(conn, :index, "December 15, 2015")
    response = json_response(conn, 200)

    assert response["unix"] == 1450137600
    assert response["natural"] == "December 15, 2015"
  end

  test "pass bad unix time", %{conn: conn} do
    conn = get conn, timestamp_path(conn, :index, "1450137600 test")
    response = json_response(conn, 200)

    assert response["unix"] == nil
    assert response["natural"] == nil
  end
end