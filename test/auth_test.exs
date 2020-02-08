defmodule AuthTest do
  use ExUnit.Case
  doctest Auth

  setup do
    auth = start_supervised!(Auth)
    %{auth: auth}
  end

  test "token not expired" do
    valid_token = %Auth.Model.Token{
      access_token: "token",
      expires_at: System.system_time(:second) + 1000
    }

    assert Auth.is_expired?(valid_token) == false
  end

  test "token is expired" do
    expired_token = %Auth.Model.Token{
      access_token: "token",
      expires_at: System.system_time(:second) - 1000
    }

    assert Auth.is_expired?(expired_token) == true
  end
end
