# a simple supervisor that starts up the Scenic.SensorPubSub server
# and any set of other sensor processes

defmodule Restid.Sensor.Supervisor do
  use Supervisor

  alias Restid.Sensor.Trips

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do

    trips_config = %{
      origin: %Restid.Model.Location{name: "Seglaregatan", lat: 57.690368, long: 11.919743},
      destinations: [
        %Restid.Model.Location{name: "ETC", lat: 57.702259, long: 11.954376},
        %Restid.Model.Location{name: "Centralstationen", lat: 57.708713, long: 11.973301}
      ]
    }

    children = [
      Scenic.Sensor,
      {Trips, trips_config},
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
