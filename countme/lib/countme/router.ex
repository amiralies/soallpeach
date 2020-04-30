defmodule Countme.Router do
  use Plug.Router
  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  post "/" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    body |> String.to_integer() |> Countme.Server.inc()
    send_resp(conn, 200, "")
  end

  get "/count" do
    send_resp(conn, 200, Countme.Server.get_count() |> to_string)
  end

  match _ do
    send_resp(conn, 404, "404 - Not found")
  end

  def handle_erros(conn, _) do
    send_resp(conn, 500, "oops :(")
  end
end
