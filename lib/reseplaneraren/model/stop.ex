# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Model.Stop do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"routeIdx",
    :"arrDate",
    :"depTime",
    :"lon",
    :"depDate",
    :"track",
    :"rtTrack",
    :"id",
    :"rtDepTime",
    :"rtArrTime",
    :"name",
    :"arrTime",
    :"lat",
    :"rtDepDate",
    :"rtArrDate"
  ]

  @type t :: %__MODULE__{
    :"routeIdx" => String.t,
    :"arrDate" => Date.t,
    :"depTime" => String.t,
    :"lon" => String.t,
    :"depDate" => Date.t,
    :"track" => String.t,
    :"rtTrack" => String.t,
    :"id" => String.t,
    :"rtDepTime" => String.t,
    :"rtArrTime" => String.t,
    :"name" => String.t,
    :"arrTime" => String.t,
    :"lat" => String.t,
    :"rtDepDate" => Date.t,
    :"rtArrDate" => Date.t
  }
end

defimpl Poison.Decoder, for: Reseplaneraren.Model.Stop do
  import Reseplaneraren.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"arrDate", :date, nil, options)
    |> deserialize(:"depDate", :date, nil, options)
    |> deserialize(:"rtDepDate", :date, nil, options)
    |> deserialize(:"rtArrDate", :date, nil, options)
  end
end

