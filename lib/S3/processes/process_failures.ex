defmodule S3.Processes.ProcessFailure do
  #exit() a primitive that allows quit the process execution bc it stands there bc the recursive calling
  #Process.link(pid) to link the actual process -self()/iex.- to another one -pid-: If this pid fails(), self() process will do it as well restarting iex(n) n-number
  #Process.unlink(pid) to unlink the actual process -self()/iex.- to another one -pid-
  #spawn_link(Module, :function, []): The combination of spawn and Process.link

  #In elixir it is easier to restart a process rather than handle the error instead. Why? Because why not? It's when your pc its not working properly and you decide to re-start it
  def calculator do
     receive do
       {pid, :+, a, b} -> send(pid, a + b)
       {pid, :-, a, b} -> send(pid, a - b)
       {pid, :x, a, b} -> send(pid, a * b)
       {_, :/, _, 0} -> exit("Division by zero")
       {pid, :/, a, b} -> send(pid, a / b)

     end
     calculator()
  end
end

#To execute:
#1. iex
#2. c("lib/S3/processes/process_failures.ex")
#3. pid = spawn(S3.Processes.ProcessFailure, :calculator, [])
#4. Process.link(pid)
#5. send(pid, {self(), :/, 4, 0})
