defmodule Restid.Sensor.Trips do
  @moduledoc """
  A GenServer that fetches trips from the API and
  publishes them to a Scenic.Sensor.
  """
  use GenServer

  alias Scenic.Sensor

  @name :trips
  @version "0.1.0"
  @description "Trips sensor"

  @poll_interval 10_000

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: @name)
  end

  def init(%{origin: origin, destinations: destinations}) do
    Sensor.register(:trips, @version, @description)

    Sensor.publish(:trips, [])

    Process.send_after(self(), :poll, 0)
    {:ok, %{origin: origin, destinations: destinations}}
  end

  def handle_info(:poll, state) do
    trips =
      state.destinations
      |> Enum.map(&Restid.Api.get_trips(state.origin, &1))
      |> Enum.flat_map(&get_in(&1, ["TripList", "Trip"]))

    Sensor.publish(:trips, trips)

    trips
      |> Enum.map(&Restid.Utils.Trips.to_string/1)
      |> Enum.map(&IO.puts/1)

    Process.send_after(self(), :poll, @poll_interval)

    {:noreply, state}
  end
end
