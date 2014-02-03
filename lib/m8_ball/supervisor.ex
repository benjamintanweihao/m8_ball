defmodule M8Ball.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({:global, __MODULE__}, __MODULE__, [])
  end

  def init([]) do
    children = [
      worker(M8Ball.Server, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
