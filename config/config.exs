import Config

alias Restid.Model.Location

config :gettext, default_locale: "sv"

config :sentry,
  dsn: "https://55c445b1ea20434aa886a8cbce13beb6@sentry.io/2543939",
  environment_name: Mix.env(),
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "production",
    target: Mix.target()
  },
  included_environments: [:prod],
  json_library: Poison

config :restid, :origin, %{name: "Kabelgatan", lat: 57.691189, long: 11.923879}

config :restid, :destinations, [
  %{name: "ETC", lat: 57.702259, long: 11.954376},
  %{name: "Centralstationen", lat: 57.708713, long: 11.973301}
]

# Enable the Nerves integration with Mix
Application.start(:nerves_bootstrap)

config :restid, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.
config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information
config :nerves, source_date_epoch: "1578826697"

targeting =
  case Mix.target() do
    :host -> :host
    _ -> :device
  end

config :timex, default_locale: "sv"

config :tzdata, :autoupdate, :disabled

import_config "#{targeting}.exs"
import_config "env/#{Mix.env()}.exs"
import_config "secret.exs"
