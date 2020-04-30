defmodule CountmeTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Countme.Router.init([])

  test "Inc by 2 and 6" do
    conn(:post, "/", "2") |> Countme.Router.call(@opts)
    conn(:post, "/", "4") |> Countme.Router.call(@opts)

    conn = conn(:get, "/count") |> Countme.Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "6"
  end
end
