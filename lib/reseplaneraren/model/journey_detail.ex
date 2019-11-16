# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.JourneyDetail do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :JourneyType,
    :errorText,
    :error,
    :serverdate,
    :servertime,
    :JourneyId,
    :Direction,
    :Stop,
    :JourneyName,
    :GeometryRef,
    :Color,
    :noNamespaceSchemaLocation
  ]

  @type t :: %__MODULE__{
          :JourneyType => JourneyType,
          :errorText => String.t(),
          :error => String.t(),
          :serverdate => Date.t(),
          :servertime => String.t(),
          :JourneyId => JourneyId,
          :Direction => Direction,
          :Stop => [Stop],
          :JourneyName => JourneyName,
          :GeometryRef => GeometryRef,
          :Color => Color,
          :noNamespaceSchemaLocation => String.t()
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.JourneyDetail do
  import Reseplaneraren.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:JourneyType, :struct, Reseplaneraren.Model.JourneyType, options)
    |> deserialize(:serverdate, :date, nil, options)
    |> deserialize(:JourneyId, :struct, Reseplaneraren.Model.JourneyId, options)
    |> deserialize(:Direction, :struct, Reseplaneraren.Model.Direction, options)
    |> deserialize(:Stop, :list, Reseplaneraren.Model.Stop, options)
    |> deserialize(:JourneyName, :struct, Reseplaneraren.Model.JourneyName, options)
    |> deserialize(:GeometryRef, :struct, Reseplaneraren.Model.GeometryRef, options)
    |> deserialize(:Color, :struct, Reseplaneraren.Model.Color, options)
  end
end
