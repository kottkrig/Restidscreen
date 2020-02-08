Application.load(:restid)

for app <- Application.spec(:restid, :applications) do
  Application.ensure_all_started(app)
end

ExUnit.start()
