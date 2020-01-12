defmodule Restid.Application do
  use Application

  def start(_type, _args) do
    main_viewport_config = Application.get_env(:restid, :viewport)

    children = [
      Auth,
      Restid.Sensor.Supervisor,
      {Scenic, viewports: [main_viewport_config]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
