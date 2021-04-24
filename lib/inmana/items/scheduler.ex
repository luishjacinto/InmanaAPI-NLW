defmodule Inmana.Items.Scheduler do
  use GenServer

  alias Inmana.Items.ExpirationNotify

  # CLIENT
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # SERVER
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotify.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end

   # async
  # GenServer.cast(pid, {:put, key, value})
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value) }
  # end

  # # sync
  # GenServer.call(pid, {:get, key})
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end
end
