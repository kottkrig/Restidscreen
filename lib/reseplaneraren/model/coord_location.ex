# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.CoordLocation do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :lon,
    :idx,
    :name,
    :type,
    :lat
  ]

  @type t :: %__MODULE__{
          :lon => String.t(),
          :idx => String.t(),
          :name => String.t(),
          :type => String.t(),
          :lat => String.t()
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.CoordLocation do
  def decode(value, _options) do
    value
  end
end
