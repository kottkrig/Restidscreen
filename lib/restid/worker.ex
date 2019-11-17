defmodule Restid.TripsWorker do
  use GenServer

  @poll_interval 10_000

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(%{origin: origin, destinations: destinations}) do
    Process.send_after(self(), :poll, @poll_interval)
    {:ok, %{origin: origin, destinations: destinations}}
  end

  def handle_info(:poll, state) do
    trips =
      state.destinations
      |> Enum.map(&Restid.Api.get_trips(state.origin, &1))
      |> Enum.flat_map(&get_in(&1, ["TripList", "Trip"]))
      |> Enum.map(&Restid.Utils.Trips.to_string/1)
      |> Enum.map(&IO.puts/1)

    Process.send_after(self(), :poll, @poll_interval)

    {:noreply, state}
  end
end
