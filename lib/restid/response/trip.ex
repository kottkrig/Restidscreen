defmodule Restid.Response.Trip do
  defstruct [
    :current_server_date_time,
    :expected_departure_date_time,
    :expected_arrival_date_time,
    :legs
  ]

  def parse_from_json(json, server_date_time) do
    legs =
      json["Leg"]
      |> Enum.map(&Restid.Response.Leg.parse_from_json(&1))
      |> trim_leading_walk_directions()
      |> trim_trailing_walk_directions()

    expected_departure_date_time = List.first(legs).expected_departure_date_time
    expected_arrival_date_time = List.last(legs).expected_arrival_date_time

    %Restid.Response.Trip{
      legs: legs,
      current_server_date_time: server_date_time,
      expected_departure_date_time: expected_departure_date_time,
      expected_arrival_date_time: expected_arrival_date_time
    }
  end

  defp trim_leading_walk_directions(legs) do
    legs
    |> Enum.drop_while(fn l -> l.type === :walk end)
  end

  defp trim_trailing_walk_directions(legs) do
    legs
    |> Enum.reverse()
    |> Enum.drop_while(fn l -> l.type === :walk end)
    |> Enum.reverse()
  end
end
