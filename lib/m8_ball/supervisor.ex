defmodule M8Ball.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init([]) do
    children = [
      worker(M8Ball.Server, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
