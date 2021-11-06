defmodule Temperatur.Api do
  use Tesla

  adapter(Tesla.Adapter.Hackney)

  @cli "restidsskärm"

  plug(Tesla.Middleware.BaseUrl, "http://api.temperatur.nu/tnu_1.17.php")
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.Query, cli: @cli)

  def temperature_for_place(place) do
    get("/", query: [p: place])
  end

  def temperature_for_coordinate(lat, lon) do
    get("/", query: [lat: lat, lon: lon])
  end
end
