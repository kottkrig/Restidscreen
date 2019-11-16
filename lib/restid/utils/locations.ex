defmodule Restid.Utils.Locations do
  alias Restid.Model.Location

  def seglaregatan do
    %Location{name: "Seglaregatan", lat: 57.690368, long: 11.919743}
  end

  def etc do
    %Location{name: "ETC", lat: 57.702259, long: 11.954376}
  end
end
