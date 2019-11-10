defmodule AuthTest do
  use ExUnit.Case
  doctest Restid

  setup do
    auth = start_supervised!(Auth)
    %{auth: auth}
  end

  test "get token" do
    # {:ok, _pid} = Auth.start_link()
    assert Auth.get_token() == "valid_token"
  end
end
