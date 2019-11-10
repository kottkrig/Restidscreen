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
  end

  defp encode_authorization_header() do
    key = Application.fetch_env!(:restid, :vasttrafik_key)
    secret = Application.fetch_env!(:restid, :vasttrafik_secret)
    "Basic " <> Base.encode64("#{key}:#{secret}")
  end
end
