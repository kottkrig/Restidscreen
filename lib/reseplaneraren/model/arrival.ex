# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.Arrival do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :fgColor,
    :stop,
    :booking,
    :JourneyDetailRef,
    :origin,
    :track,
    :rtTrack,
    :sname,
    :type,
    :date,
    :bgColor,
    :stroke,
    :rtDate,
    :time,
    :name,
    :rtTime,
    :night,
    :stopid,
    :journeyid,
    :accessibility
  ]

  @type t :: %__MODULE__{
          :fgColor => String.t(),
          :stop => String.t(),
          :booking => boolean(),
          :JourneyDetailRef => JourneyDetailRef,
          :origin => String.t(),
          :track => String.t(),
          :rtTrack => String.t(),
          :sname => String.t(),
          :type => String.t(),
          :date => Date.t(),
          :bgColor => String.t(),
          :stroke => String.t(),
          :rtDate => Date.t(),
          :time => String.t(),
          :name => String.t(),
          :rtTime => String.t(),
          :night => boolean(),
          :stopid => String.t(),
          :journeyid => String.t(),
          :accessibility => String.t()
        }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.Arrival do
  import Reseplaneraren.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:JourneyDetailRef, :struct, Reseplaneraren.Model.JourneyDetailRef, options)
    |> deserialize(:date, :date, nil, options)
    |> deserialize(:rtDate, :date, nil, options)
  end
end
