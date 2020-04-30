defmodule Countme.Server do
  use GenServer

  def start_link(init_count) do
    GenServer.start_link(__MODULE__, init_count, name: __MODULE__)
  end

  def inc(n) do
    GenServer.cast(__MODULE__, {:inc, n})
  end

  def get_count do
    GenServer.call(__MODULE__, :get_count)
  end

  @impl true
  def init(init_count) do
    {:ok, init_count}
  end

  @impl true
  def handle_cast({:inc, n}, count) do
    {:noreply, count + n}
  end

  @impl true
  def handle_call(:get_count, _from, count) do
    {:reply, count, count}
  end
end
