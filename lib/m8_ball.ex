defmodule M8Ball do
  use Application.Behaviour

  #############
  # Callbacks #
  #############

  def start(_type, _args) do
    M8Ball.Supervisor.start_link
  end

  def stop(_state) do
    :ok
  end

  #############
  # Interface #
  #############

  def ask(question) do
    M8Ball.Server.ask(question)    
  end

end
