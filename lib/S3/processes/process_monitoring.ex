defmodule S3.Processes.ProcessMonitor do
  #Process.monitor(pid) - same behavior as Process.link(pid) but now it just not linked but also 'keep an eye on it'. It returns a Reference that must be stored if you want to demonitor later
  #Process.demonitor(ref) - to demonitor a linked pid - returns true by default
  #spawn_monitor(Module, :function, []) - The combination of spawn and Process.monitor - Returns a tuple: {process_id, reference}
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
#4. ref = Process.monitor(pid)
#5. send(pid, {self(), :+, 2, 3})
#6. send(pid, {self(), :/, 2, 0})
#7. Process.alive?(pid)
#8. flush()