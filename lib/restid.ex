defmodule Restid do
  @moduledoc """
  A wrapper around the Vasttrafik Elixir API
  """
  use Tesla

  alias Restid.Request.Location

  @doc """
  Returns the trips from a given `origin` to a given `destination`.

  ## Examples

      iex> origin = %Restid.Request.Location{name: "Seglaregatan", lat: 57.690368, long: 11.919743}
      iex> destination = %Restid.Request.Location{name: "Centralstationen", lat: 57.708713, long: 11.973301}
      iex> {:ok, %Restid.Response{} = response} = Restid.get_trips(origin, destination)
      iex> response.server_date_time
      ~N[2020-02-08 12:16:00]
  """
  def get_trips(%Location{} = origin, %Location{} = destination) do
    response =
      restid_api().get_trips(origin, destination)
      |> Restid.Response.parse_result()
  end

  defp restid_api() do
    Application.get_env(:restid, :restid_api)
  end
end
