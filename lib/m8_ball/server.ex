defmodule M8Ball.Server do
  use GenServer

  #######
  # API #
  #######

  def start_link do
    GenServer.start_link(__MODULE__, [], [name: {:global, __MODULE__}])
  end

  def stop do
    GenServer.call({:global, __MODULE__}, :stop)
  end

  def ask(_question) do
    GenServer.call({:global, __MODULE__}, :ask)
  end

  #############
  # Callbacks #
  #############

  def init([]) do
    <<a::size(32), b::size(32), c::size(32)>> = :crypto.rand_bytes(12)
    :random.seed(a, b, c)
    {:ok, []}
  end

  def handle_call(:ask, _from, state) do
    answer = Enum.shuffle(answers) |> List.first
    {:reply, answer, state}
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def handle_call(_call, _from, state) do
    {:noreply, state}
  end

  defp answers do
    [ 
      "Yes", 
      "No", 
      "Doubtful", 
      "I don't like your tone", 
      "Of course not", 
      "*backs away slow and runs away*"
    ]
  end

end
