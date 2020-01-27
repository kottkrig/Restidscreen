defmodule Auth.InMemory do
  def get_token() do
    current_time = System.system_time(:second)

    %Auth.Model.Token{
      access_token: "ACCESS_TOKEN_FROM_AUTH_API",
      expires_at: current_time + 3600
    }
  end
end
