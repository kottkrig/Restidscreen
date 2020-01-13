use Mix.Config

alias Restid.Model.Location

config :restid, :origin, %{name: "Seglaregatan", lat: 57.690368, long: 11.919743}

config :restid, :destinations, [
  %{name: "ETC", lat: 57.702259, long: 11.954376},
  %{name: "Centralstationen", lat: 57.708713, long: 11.973301}
]

targeting =
  case Mix.target() do
    :host -> :host
    _ -> :device
  end

import_config "#{targeting}.exs"
