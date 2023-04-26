defmodule S3.Genserver.Supervisor2 do
  alias S3.Genserver.Genserver2, as: GCalculator
  use Supervisor

  def start_link([]) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      {GCalculator, [] }
    ]

    # Restart the process if it crashes due to a division by zero error
    # with a maximum of 3 restarts in 10 seconds.

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 3, max_seconds: 10)
  end
end

#c("lib/S3/genserver/supervisor_2.ex")