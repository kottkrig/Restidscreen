defmodule Auth.Model.Token do
  @enforce_keys [:access_token, :expires_at]
  defstruct [:access_token, :expires_at]
end
