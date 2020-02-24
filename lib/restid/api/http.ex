defmodule Restid.Api.Http do
  alias Restid.Request.Location

  use Tesla

  def get_trips(%Location{} = origin, %Location{} = destination) do
    case Auth.get_token() do
      {:error, error} ->
        {:error, error}

      {:ok, token} ->
        response =
          client(token)
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
    end
  end

  defp client(token) do
    Tesla.build_client([
      {Tesla.Middleware.Headers,
       %{"Authorization" => "Bearer " <> token, "Accept" => "application/json"}},
      Tesla.Middleware.JSON,
      Tesla.Middleware.DebugLogger
    ])
  end

  # for some reason all the api calls returns an error
  # but the value seems to be parsed properly
  defp parse_results({:error, %Poison.ParseError{value: json}}), do: {:ok, json}

  defp parse_results({:error, %Tesla.Env{} = _tesla}), do: {:error, "Unknown Tesla runtime error"}
end
