defmodule Countme.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Countme.Server, 0},
      {Plug.Cowboy, scheme: :http, plug: Countme.Router, port: 80}
    ]

    opts = [strategy: :one_for_one, name: Countme.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
