defmodule M8Ball do
  use Application

  #############
  # Callbacks #
  #############

  def start(_type, _args) do
    M8Ball.Supervisor.start_link
  end

  def start({:takeover, _other_node}, []) do
    M8Ball.Supervisor.start_link
  end

  def stop(_state) do
    :ok
  end

  #######
  # API #
  #######

  def ask(question) do
    M8Ball.Server.ask(question)    
  end

end
