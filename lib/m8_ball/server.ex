defmodule M8Ball.Server do
  use GenServer.Behaviour

  #############
  # Interface #
  #############

  def start_link do
    :gen_server.start_link({:global, __MODULE__},__MODULE__, [], [])
  end

  def stop do
    :gen_server.call({:global, __MODULE__}, :stop)
  end

  def ask(_question) do
    :gen_server.call({:global, __MODULE__}, :question)
  end

  #############
  # Callbacks #
  #############

  def init([]) do
    <<a::size(32), b::size(32), c::size(32)>> = :crypto.rand_bytes(12)
    :random.seed(a, b, c)
    {:ok, []}
  end

  def handle_call(:question, _from, state) do
    {:ok, answers} = :application.get_env(:m8_ball, :answers)
    answer = Enum.shuffle(answers) |> Enum.first
    {:reply, answer, state}
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def handle_call(_call, _from, state) do
    {:noreply, state}
  end
  
end
