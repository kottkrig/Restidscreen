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
end
