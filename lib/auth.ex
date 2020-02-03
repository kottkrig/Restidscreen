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
    {:ok, nil_token()}
  end

  @doc """
  Returns a valid token string

  ## Examples

    iex> Auth.get_token()
    {:ok, "ACCESS_TOKEN_FROM_AUTH_API"}
  """
  def get_token do
    GenServer.call(__MODULE__, :get_token)
  end

  def handle_call(:get_token, _from, state) do
    if is_expired?(state) do
      case auth_api().get_token() do
        {:ok, new_token} ->
          {:reply, {:ok, new_token.access_token}, new_token}

        {:error, error} ->
          {:reply, {:error, error}, nil_token()}
      end
    else
      {:reply, {:ok, state.access_token}, state}
    end
  end

  defp auth_api() do
    Application.get_env(:restid, :auth_api)
  end

  defp nil_token, do: %Token{access_token: nil, expires_at: nil}

  def is_expired?(%Token{expires_at: nil}), do: true

  def is_expired?(%Token{expires_at: expires_at}) do
    System.system_time(:second) >= expires_at
  end
end
