defmodule Restid.Api do
  use Tesla

  def system_info() do
    Reseplaneraren.Api.Systeminfo.get_system_info(client(), [{:format, "json"}])
  end

  def locations_near_seglaregatan() do
    Reseplaneraren.Api.Location.get_nearby_stops(client(), 57.690368, 11.919743, [
      {:format, "json"}
    ])
  end

  defp client() do
    token = Auth.get_token()

    Tesla.build_client([
      {Tesla.Middleware.Headers,
       %{"Authorization" => "Bearer " <> token, "Accept" => "application/json"}},
      Tesla.Middleware.JSON,
      Tesla.Middleware.DebugLogger
    ])
  end
end
