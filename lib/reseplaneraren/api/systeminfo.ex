# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule Reseplaneraren.Api.Systeminfo do
  @moduledoc """
  API calls for all endpoints tagged `Systeminfo`.
  """

  alias Reseplaneraren.Connection
  import Reseplaneraren.RequestBuilder

  @doc """
  Provides information about the journey planner and the underlying data
  Provides information about the journey planner and underlying data. It will return the begin of end of the timetable period and the creation date of the timetable data.

  ## Parameters

  - connection (Reseplaneraren.Connection): Connection to server
  - opts (KeywordList): [optional] Optional parameters
    - :format (String.t): the required response format
    - :jsonp_callback (String.t): If JSONP response format is needed, you can append an additional parameter to specify the name of a callback function, and the JSON object will be wrapped by a function call with this name.

  ## Returns

  {:ok, %Reseplaneraren.Model.SystemInfo{}} on success
  {:error, info} on failure
  """
  @spec get_system_info(Tesla.Env.client(), keyword()) ::
          {:ok, Reseplaneraren.Model.SystemInfo.t()} | {:error, Tesla.Env.t()}
  def get_system_info(connection, opts \\ []) do
    optional_params = %{
      :format => :query,
      :jsonpCallback => :query
    }

    %{}
    |> method(:get)
    |> url("/systeminfo")
    |> add_optional_params(optional_params, opts)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%Reseplaneraren.Model.SystemInfo{})
  end
end
