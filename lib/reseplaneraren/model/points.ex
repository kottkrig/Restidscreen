# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.Points do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :Point
  ]

  @type t :: %__MODULE__{
          :Point => [Point]
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.Points do
  import Reseplaneraren.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:Point, :list, Reseplaneraren.Model.Point, options)
  end
end
