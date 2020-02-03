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
      |> Enum.map(&Restid.get_trips(state.origin, &1))
      |> Enum.filter(&match?({:ok, _}, &1))
      |> Enum.map(fn {:ok, response} -> response end)
      |> Enum.flat_map(fn r -> r.trips end)

    Sensor.publish(:trips, trips)

    Process.send_after(self(), :poll, @poll_interval)

    {:noreply, state}
  end
end
