defmodule M8Ball.Mixfile do
  use Mix.Project

  def project do
    [ app: :m8_ball,
      version: "0.0.1",
      elixir: "~> 0.12.2-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
       mod: { M8Ball, [] },
       env: [
              answers: [ 
                         "Yes", 
                         "No", 
                         "Doubtful", 
                         "I don't like your tone", 
                         "Of course not", 
                         "*backs away slow and runs away*"
                       ]

            ]
    ]
  end

  defp deps do
    []
  end
end
