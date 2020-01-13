use Mix.Config

# Note: We don't need the hal_module config anymore
config :restid, :viewport, %{
  name: :main_viewport,
  default_scene: {Restid.Scene.Main, nil},
  # Match these to your inky display
  size: {400, 300},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: Scenic.Driver.Glfw
    }
  ]
}
