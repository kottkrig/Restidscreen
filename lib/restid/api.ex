defmodule Restid.Api do
  use Tesla

  alias Restid.Model.Location

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
end
