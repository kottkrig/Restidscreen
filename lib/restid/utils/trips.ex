defmodule Restid.Utils.Trips do
  def to_string(%{"Leg" => legs}) do
    legs
    |> Enum.reduce("", fn leg, acc ->
      case acc do
        "" ->
          "Kl #{leg["Origin"]["rtTime"]} – #{leg["name"]} (mot #{leg["direction"]}) från #{
            leg["Origin"]["name"]
          } till #{leg["Destination"]["name"]}"

        acc ->
          acc <>
            ", byte till #{leg["name"]} (mot #{leg["direction"]}) till #{
              leg["Destination"]["name"]
            }"
      end
    end)
  end

  def to_pretty_string(%{"Leg" => legs}) do
    legs
    |> Enum.reduce("", fn leg, acc ->
      case acc do
        "" ->
          "Kl #{leg["Origin"]["rtTime"]} – #{leg["name"]} (mot #{leg["direction"]})\n                    Från #{
            prettify_location_name(leg["Origin"]["name"])
          } till #{prettify_location_name(leg["Destination"]["name"])}"

        acc ->
          acc <>
            ", byte till #{leg["name"]} (mot #{leg["direction"]}) till #{
              prettify_location_name(leg["Destination"]["name"])
            }"
      end
    end)
  end

  def prettify_location_name(location_name) do
    location_name
    |> String.split(", ")
    |> Enum.take(1)
  end

end
