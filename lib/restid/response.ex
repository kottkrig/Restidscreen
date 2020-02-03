defmodule Restid.Response do
  defstruct [:server_date_time, :trips]

  def parse_from_json(json) do
    server_date_time =
      NaiveDateTime.from_iso8601!(
        "#{json["TripList"]["serverdate"]} #{json["TripList"]["servertime"]}:00"
      )

    %Restid.Response{
      server_date_time: server_date_time,
      trips:
        Enum.map(
          json["TripList"]["Trip"],
          &Restid.Response.Trip.parse_from_json(&1, server_date_time)
        )
    }
  end
end
