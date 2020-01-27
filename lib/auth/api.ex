defmodule Auth.Api do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.vasttrafik.se")

  plug(Tesla.Middleware.Headers, %{
    "Authorization" => encode_authorization_header(),
    "Content-Type" => "application/x-www-form-urlencoded"
  })

  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)

  def get_token() do
    post("/token", "grant_type=client_credentials&scope=device_test")
    |> parse_result()
  end

  defp parse_result(result) do
    current_time = System.system_time(:second)

    %Auth.Model.Token{
      access_token: result.body["access_token"],
      expires_at: current_time + result.body["expires_in"]
    }
  end

  defp encode_authorization_header() do
    key = Application.get_env(:restid, :vasttrafik_api_key)
    secret = Application.get_env(:restid, :vasttrafik_api_secret)
    "Basic " <> Base.encode64("#{key}:#{secret}")
  end
end
