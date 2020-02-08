defmodule Restid.Component.Trip do
  use Scenic.Component
  import Scenic.Primitives

  alias Scenic.Graph
  alias Scenic.ViewPort

  @height 60

  @graph Graph.build()
         |> text("ca XX min",
           id: :departure_time,
           text_align: :right_top,
           fill: :black,
           translate: {395, 0},
           font_size: 40
         )
         |> text("Spårvagn 9, mot Angered",
           id: :description,
           text_align: :left_top,
           fill: :black,
           font_size: 20,
           translate: {0, 5}
         )
         |> text("Från Jaegerdorfsplatsen",
           id: :origin_name,
           text_align: :left_top,
           fill: :black,
           font_size: 20,
           translate: {0, 25}
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
      |> Graph.modify(
        :departure_time,
        &text(&1, format_time(trip.current_server_date_time, trip.expected_departure_date_time))
      )
      |> Graph.modify(
        :origin_name,
        &text(&1, format_origin(trip))
      )

    state = %{
      graph: graph,
      text: trip_as_string
    }

    {:ok, state, push: graph}
  end

  defp format_time(%NaiveDateTime{} = server_date_time, {:real_time, date_time}) do
    server_date_time
    |> NaiveDateTime.diff(date_time)
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
    |> shorten_time_string()
  end

  defp format_time(%NaiveDateTime{} = server_date_time, {:scheduled, date_time}) do
    formatted_duration =
      server_date_time
      |> NaiveDateTime.diff(date_time)
      |> Timex.Duration.from_seconds()
      |> Timex.format_duration(:humanized)
      |> shorten_time_string()

    "ca #{formatted_duration}"
  end

  defp shorten_time_string(time_string) do
    time_string
    |> String.replace("minuter", "min")
  end

  defp format_description(%Restid.Response.Trip{legs: []}), do: "N/A"

  defp format_description(%Restid.Response.Trip{legs: legs}) do
    first_leg = List.first(legs)

    "#{first_leg.name}, mot #{first_leg.direction}"
  end

  defp format_origin(%Restid.Response.Trip{legs: []}), do: "N/A"

  defp format_origin(%Restid.Response.Trip{legs: legs}) do
    first_leg = List.first(legs)

    "Från #{first_leg.origin.short_name}"
  end
end
