defmodule Restid.Scene.Main do
  @moduledoc """
  The main Scenic.Scene that shows a list of trips.
  """
  use Scenic.Scene

  alias Scenic.Graph
  alias Scenic.Sensor

  import Scenic.Primitives

  @font :roboto
  @font_size 20

  def init(_, opts) do
    {:ok, %Scenic.ViewPort.Status{size: {width, height}}} =
      opts[:viewport]
      |> Scenic.ViewPort.info()

    graph =
      Graph.build(font_size: @font_size, font: @font, theme: :light)
      |> rectangle({width, height}, fill: :white)
      |> text("Resor har inte kunnat laddas än",
        fill: :black,
        id: :content,
        translate: {0, 20}
      )

    Sensor.subscribe(:trips)

    state = %{graph: graph, viewport: opts[:viewport]}

    {:ok, state, push: graph}
  end

  def handle_info({:sensor, :data, {:trips, trips, _}}, state) do
    {:ok, %Scenic.ViewPort.Status{size: {width, height}}} =
      state.viewport
      |> Scenic.ViewPort.info()

    graph =
      Graph.build(font_size: @font_size, font: @font, theme: :light)
      |> rectangle({width, height}, fill: :white)

    {:ok, {:temperature, temperature, _}} = Scenic.Sensor.get(:temperature)

    graph =
      graph
      |> text("#{temperature}°",
        text_align: :center_top,
        fill: :black,
        font_size: 40,
        translate: {width / 2, 5}
      )
      |> line({{0, 50}, {width, 50}}, fill: :black)

    graph =
      trips
      |> Enum.with_index()
      |> Enum.reduce(graph, fn {trip, i}, g ->
        g
        |> Restid.Component.Trip.add_to_graph(trip,
          translate: {5, (i + 1) * 60}
        )
      end)

    {:noreply, state, push: graph}
  end

  def handle_info({:sensor, :unregistered, :trips}, state) do
    {:noreply, state}
  end

  def handle_info({:sensor, :registered, _}, state) do
    {:noreply, state}
  end
end
