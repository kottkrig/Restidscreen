defmodule Restid.Application do
  use Application

  def start(_type, _args) do
    children = [Auth, {Restid.TripsWorker, Config.trips_config()}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
