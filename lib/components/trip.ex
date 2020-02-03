defmodule Restid.Component.Trip do
  use Scenic.Component
  import Scenic.Primitives

  alias Scenic.Graph
  alias Scenic.ViewPort

  @height 60

  @graph Graph.build()
         |> text("",
           id: :departure_time,
           text_align: :left_top,
           fill: :black,
           translate: {0, 0},
           font_size: 50
         )
         |> text("Spårvagn 9",
           id: :description,
           text_align: :left_top,
           fill: :black,
           font_size: 20,
           translate: {115, 5}
         )
         |> text("Framme kl XX:XX",
           id: :arrival_time,
           text_align: :left_top,
           fill: :black,
           font_size: 20,
           translate: {115, 25}
         )

  def info(data),
    do: """
      #{IO.ANSI.red()}#{__MODULE__} data must be a bitstring
      #{IO.ANSI.yellow()}Received: #{inspect(data)}
      #{IO.ANSI.default_color()}
    """

  def verify(%Restid.Response.Trip{} = trip), do: {:ok, trip}
  def verify(_), do: :invalid_data

  def init(trip, opts) do
    trip_as_string = "Test"

    # modify the already built graph
    graph =
      @graph
      |> Graph.modify(:_root_, &update_opts(&1, styles: opts[:styles]))
      |> Graph.modify(:description, &text(&1, format_description(trip)))
      |> Graph.modify(:departure_time, &text(&1, format_time(trip.expected_departure_date_time)))
      |> Graph.modify(
        :arrival_time,
        &text(&1, "Framme kl #{format_time(trip.expected_arrival_date_time)}")
      )

    state = %{
      graph: graph,
      text: trip_as_string
    }

    {:ok, state, push: graph}
  end

  defp format_time({:real_time, date_time}) do
    "#{pad(date_time.hour)}:#{pad(date_time.minute)}"
  end

  defp format_time({:scheduled, date_time}) do
    "~#{pad(date_time.hour)}:#{pad(date_time.minute)}"
  end

  defp format_time(:unknown) do
    "N/A"
  end

  defp format_time(%NaiveDateTime{} = date_time) do
    "#{pad(date_time.hour)}:#{pad(date_time.minute)}"
  end

  defp pad(number) do
    String.pad_leading("#{number}", 2, "0")
  end

  defp format_description(%Restid.Response.Trip{legs: legs}) do
    legs
    |> Enum.map(&Map.get(&1, :name))
    |> Enum.join(", ")
  end
end
