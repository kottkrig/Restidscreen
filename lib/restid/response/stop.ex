defmodule Restid.Response.Stop do
  defstruct [:id, :name, :type, :short_name, :real_time_date_time, :scheduled_date_time]

  def parse_from_json(json) do
    %Restid.Response.Stop{
      id: json["id"],
      name: json["name"],
      short_name: parse_short_name(json["name"]),
      type: parse_type(json["type"]),
      real_time_date_time: parse_date_time(json["rtDate"], json["rtTime"]),
      scheduled_date_time: parse_date_time(json["date"], json["time"])
    }
  end

  defp parse_type(type_string) do
    case type_string do
      "ST" -> :stop
      "ADR" -> :address
      _ -> :unknown
    end
  end

  defp parse_date_time(date_string, time_string) do
    case NaiveDateTime.from_iso8601("#{date_string} #{time_string}:00") do
      {:ok, date_time} -> date_time
      _ -> nil
    end
  end

  defp parse_short_name(name_string) do
    name_string
    |> String.split(", ")
    |> List.first()
  end
end
