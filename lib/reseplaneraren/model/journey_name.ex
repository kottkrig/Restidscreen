# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.JourneyName do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :routeIdxTo,
    :routeIdxFrom,
    :name
  ]

  @type t :: %__MODULE__{
          :routeIdxTo => integer(),
          :routeIdxFrom => integer(),
          :name => String.t()
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.JourneyName do
  def decode(value, _options) do
    value
  end
end
