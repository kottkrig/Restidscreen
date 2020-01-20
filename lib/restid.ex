defmodule Restid do
  @moduledoc """
  A wrapper around the Vasttrafik Elixir API
  """
  use Tesla

  alias Restid.Model.Location

  @doc """
  Returns the trips from a given `origin` to a given `destination`.

  ## Examples

      iex> origin = %Location{name: "Seglaregatan", lat: 57.690368, long: 11.919743}
      iex> destination = %Location{name: "Centralstationen", lat: 57.708713, long: 11.973301}
      iex> Restid.get_trips(origin, destination)
      [%Trip{}]
  """
  def get_trips(%Location{} = origin, %Location{} = destination) do
    client()
    |> Reseplaneraren.Api.Trip.get_trip(
      originCoordLat: origin.lat,
      originCoordLong: origin.long,
      originCoordName: origin.name,
      destCoordLat: destination.lat,
      destCoordLong: destination.long,
      destCoordName: destination.name,
      format: "json"
    )
    |> parse_results()
    |> trim_leading_walk_directions()
    |> trim_trailing_walk_directions()
  end

  defp client() do
    token = Auth.get_token()

    Tesla.build_client([
      {Tesla.Middleware.Headers,
       %{"Authorization" => "Bearer " <> token, "Accept" => "application/json"}},
      Tesla.Middleware.JSON,
      Tesla.Middleware.DebugLogger
    ])
  end

  # for some reason all the api calls returns an error
  # but the value seems to be parsed properly
  defp parse_results({:error, %Poison.ParseError{value: json}}), do: json

  defp trim_leading_walk_directions(trips_result) do
    update_in(trips_result, ["TripList", "Trip"], fn trips ->
      Enum.map(trips, fn trip ->
        update_in(trip, ["Leg"], fn legs ->
          Enum.drop_while(legs, fn leg -> leg["type"] === "WALK" end)
        end)
      end)
    end)
  end

  defp trim_trailing_walk_directions(trips_result) do
    update_in(trips_result, ["TripList", "Trip"], fn trips ->
      Enum.map(trips, fn trip ->
        update_in(trip, ["Leg"], fn legs ->
          legs
          |> Enum.reverse()
          |> Enum.drop_while(fn leg -> leg["type"] === "WALK" end)
          |> Enum.reverse()
        end)
      end)
    end)
  end
end
