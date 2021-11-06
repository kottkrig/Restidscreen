defmodule Restid.Sensor.Temperature do
  @moduledoc """
  A GenServer that fetches trips from the API and
  publishes them to a Scenic.Sensor.
  """
  use GenServer

  alias Scenic.Sensor

  @name :temperature
  @version "0.1.0"
  @description "Temperature sensor"

  @poll_interval 360_000

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: @name)
  end

  def init(%{origin: origin}) do
    Sensor.register(:temperature, @version, @description)

    Sensor.publish(:temperature, [])

    Process.send_after(self(), :poll, 10_000)
    {:ok, %{origin: origin}}
  end

  def handle_info(:poll, state) do
    %Tesla.Env{body: body} =
      Temperatur.Api.temperature_for_coordinate(state.origin.lat, state.origin.long)

    temperature =
      body
      |> Map.fetch!("stations")
      |> List.first()
      |> Map.fetch!("temp")

    Sensor.publish(:temperature, temperature)

    Process.send_after(self(), :poll, @poll_interval)

    {:noreply, state}
  end
end
