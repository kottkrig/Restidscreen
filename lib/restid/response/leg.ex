defmodule Restid.Response.Leg do
  defstruct [
    :id,
    :name,
    :short_name,
    :type,
    :origin,
    :destination,
    :direction,
    :expected_departure_date_time,
    :expected_arrival_date_time
  ]

  def parse_from_json(json) do
    origin = Restid.Response.Stop.parse_from_json(json["Origin"])
    destination = Restid.Response.Stop.parse_from_json(json["Destination"])

    %Restid.Response.Leg{
      id: json["id"],
      name: json["name"],
      short_name: json["sname"],
      type: parse_type(json["type"]),
      origin: origin,
      destination: destination,
      direction: json["direction"],
      expected_departure_date_time: get_time_from_stop(origin),
      expected_arrival_date_time: get_time_from_stop(destination)
    }
  end

  defp parse_type(type_string) do
    case type_string do
      "WALK" -> :walk
      "TRAM" -> :tram
      "BUS" -> :bus
    end
  end

  defp get_time_from_stop(stop) do
    cond do
      stop.real_time_date_time -> {:real_time, stop.real_time_date_time}
      stop.scheduled_date_time -> {:scheduled, stop.scheduled_date_time}
      true -> :unknown
    end
  end
end
