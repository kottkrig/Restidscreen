defmodule Restid.Response do
  defstruct [:server_date_time, :trips]

  def parse_result({:ok, json}) do
    {:ok, parse_from_json(json)}
  end

  def parse_result({:error, %Tesla.Error{message: message}}) do
    {:error, message}
  end

  def parse_result({:error, error}) do
    {:error, error}
  end

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
