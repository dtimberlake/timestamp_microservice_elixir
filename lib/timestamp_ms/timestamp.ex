defmodule TimestampMs.Timestamp do

  ##################
  # Public Methods #
  ##################

  def parse_timestamp(timestamp) do
    timestamp |> do_parse_timestamp |> convert_to_map
  end

  defp do_parse_timestamp(timestamp) do
    case Integer.parse(timestamp) do
      {unix, ""} -> Timex.from_unix(unix)
      _ -> parse_str_timestamp(timestamp)
    end
  end

  ###################c
  # Private Methods #
  ###################

  defp parse_str_timestamp(timestamp) do
    case Timex.parse(timestamp, "%B %-d, %Y", :strftime) do
      {:ok, dt} -> dt
      _ -> :error
    end
  end

  defp convert_to_map(:error) do
    %{ unix: nil, natural: nil }
  end

  defp convert_to_map(dt) do
    %{
      unix: Timex.to_unix(dt),
      natural: Timex.format!(dt, "%B %-d, %Y", :strftime)
    }
  end
end