defmodule Restid.Sensor.Supervisor do
  @moduledoc """
  A simple supervisor that starts up the Scenic.SensorPubSub server
  and any set of other sensor processes
  """
  use Supervisor

  alias Restid.Sensor.Trips
  alias Restid.Sensor.Temperature

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    trips_config = %{
      origin: struct(Restid.Request.Location, Application.get_env(:restid, :origin)),
      destinations:
        Application.get_env(:restid, :destinations)
        |> Enum.map(&struct(Restid.Request.Location, &1))
    }

    temperature_config = %{
      origin: struct(Restid.Request.Location, Application.get_env(:restid, :origin))
    }

    children = [
      Scenic.Sensor,
      {Trips, trips_config},
      {Temperature, temperature_config}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
