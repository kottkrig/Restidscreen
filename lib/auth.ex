defmodule Auth do
  @moduledoc """
  A GenServer that holds the Vasttrafik
  auth token and renews it when it expires.
  """
  use GenServer

  alias Auth.Model.Token

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, %Token{access_token: nil, expires_at: nil}}
  end

  @doc """
  Returns a valid token string

  ## Examples

    iex> Auth.get_token()
    "ACCESS_TOKEN_FROM_AUTH_API"
  """
  def get_token do
    GenServer.call(__MODULE__, :get_token)
  end

  def handle_call(:get_token, _from, state) do
    if is_expired?(state) do
      new_token = auth_api().get_token()
      {:reply, new_token.access_token, new_token}
    else
      {:reply, state.access_token, state}
    end
  end

  defp auth_api() do
    Application.get_env(:restid, :auth_api)
  end

  def is_expired?(%Token{expires_at: nil}), do: true

  def is_expired?(%Token{expires_at: expires_at}) do
    System.system_time(:second) >= expires_at
  end
end
