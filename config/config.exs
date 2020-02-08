use Mix.Config

alias Restid.Model.Location

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

config :restid, :origin, %{name: "Seglaregatan", lat: 57.690368, long: 11.919743}

config :restid, :destinations, [
  %{name: "ETC", lat: 57.702259, long: 11.954376},
  %{name: "Centralstationen", lat: 57.708713, long: 11.973301}
]

config :restid, target: Mix.target()

targeting =
  case Mix.target() do
    :host -> :host
    _ -> :device
  end

config :timex, default_locale: "sv"

import_config "#{targeting}.exs"
import_config "env/#{Mix.env()}.exs"
import_config "secret.exs"
