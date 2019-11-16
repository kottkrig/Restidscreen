# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.JourneyId do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :routeIdxTo,
    :routeIdxFrom
  ]

  @type t :: %__MODULE__{
          :id => String.t(),
          :routeIdxTo => integer(),
          :routeIdxFrom => integer()
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.JourneyId do
  def decode(value, _options) do
    value
  end
end
