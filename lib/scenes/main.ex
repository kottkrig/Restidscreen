defmodule Restid.Scene.Main do
  @moduledoc """
  The main Scenic.Scene that shows a list of trips.
  """
  use Scenic.Scene
  alias Scenic.Graph
  alias Scenic.Sensor

  import Scenic.Primitives
  import Scenic.Components

  @font :roboto
  @font_size 20

  def init(_, _) do
    graph =
      Graph.build(font_size: @font_size, font: @font)
      |> text("Blipp", id: :content, translate: {0, 20})

    Sensor.subscribe(:trips)

    {:ok, graph, push: graph}
  end

  def handle_info({:sensor, :data, {:trips, trips, _}}, graph) do
    content =
      trips
      |> Enum.map(&Restid.Utils.Trips.to_string/1)
      |> Enum.join("\n")

    graph =
      graph
      |> Graph.modify(:content, &text(&1, content))

    {:noreply, graph, push: graph}
  end
end
