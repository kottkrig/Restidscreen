use Mix.Config

config :restid, :auth_api, Auth.InMemory
config :restid, :restid_api, Restid.Api.InMemory
