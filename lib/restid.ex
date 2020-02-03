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
      {:ok, [%Trip{}]}
  """
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
          |> Restid.Response.parse_from_json()

        {:ok, response}
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
  defp parse_results({:error, %Poison.ParseError{value: json}}), do: json
end
