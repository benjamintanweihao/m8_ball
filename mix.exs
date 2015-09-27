defmodule M8Ball.Mixfile do
  use Mix.Project

  def project do
    [ app: :m8_ball,
      version: "0.0.1",
      elixir: "~> 1.1",
      deps: [] ]
  end

  # Configuration for the OTP application
  def application do
    [
       mod: { M8Ball, [] },
    ]
  end

end
