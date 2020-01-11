defmodule Auth do
  @moduledoc """
  A GenServer that holds the Vasttrafik
  auth token and renews it when it expires.
  """
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, %{access_token: nil, expires_at: nil}}
  end

  @doc """
  Returns a valid token

  ## Examples

    iex> Auth.get_token()
    %String
  """
  def get_token do
    GenServer.call(__MODULE__, :get_token)
  end

  def handle_call(:get_token, _from, state) do
    if is_expired?(state) do
      current_time = System.system_time(:second)
      %{access_token: access_token, expires_in: expires_in} = fetch_token()

      {:reply, access_token,
       %{
         access_token: access_token,
         expires_at: current_time + expires_in
       }}
    else
      {:reply, state.access_token, state}
    end
  end

  defp is_expired?(%{expires_at: nil}), do: true

  defp is_expired?(%{expires_at: expires_at}) do
    System.system_time(:second) >= expires_at
  end

  defp fetch_token() do
    response = Auth.Api.get_token()
    %{access_token: response.body["access_token"], expires_in: response.body["expires_in"]}
  end
end
