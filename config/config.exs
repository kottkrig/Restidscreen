use Mix.Config

alias Restid.Model.Location

config :restid, :origin, %{name: "Seglaregatan", lat: 57.690368, long: 11.919743}

config :restid, :destinations, [
  %{name: "ETC", lat: 57.702259, long: 11.954376},
  %{name: "Centralstationen", lat: 57.708713, long: 11.973301}
]

config :restid, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information

config :nerves, source_date_epoch: "1578826697"

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

targeting =
  case Mix.target() do
    :host -> :host
    _ -> :device
  end

import_config "#{targeting}.exs"
import_config "env/#{Mix.env()}.exs"
import_config "secret.exs"
