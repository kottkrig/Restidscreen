defmodule Config do
  alias Restid.Model.Location

  def trips_config do
    %{
      origin: %Location{name: "Seglaregatan", lat: 57.690368, long: 11.919743},
      destinations: [
        %Location{name: "ETC", lat: 57.702259, long: 11.954376},
        %Location{name: "Centralstationen", lat: 57.708713, long: 11.973301}
      ]
    }
  end
end
