defmodule S3.Processes.Process3 do
  #Make a counter using a process dynamic.
  def counter(), do: counter(0)
  defp counter(n) do
    new_n = receive do
        #In other to send something to pid's inbox the value n
        #If you call inc, dec or reset, in order to see the new value call it first, and then flush() to see it in the console - It just show it once.
        {:get, pid} -> send(pid, n)
        #Increment by 1 number n
        {:inc} -> n + 1
        #Decrement by 1 number n
        {:dec} -> n - 1
        #Restart the counter
        {:reset} -> 0

    end
    counter(new_n)
  end

  #Making a counter using a process dynamic and storing in the dictionary of Process.info(pid)
  def counter_2() do
    value = Process.get(:value) || 0
    receive do
      {:get, pid} -> send(pid, value)
      {:inc} -> Process.put(:value, value + 1)
      {:dev} -> Process.put(:value, value - 1)
      {:reset} -> Process.put(:value, 0)
    end
    counter_2()
  end
end

#To execute:
#1. iex
#2. c("lib/S3/processes/process_3.ex")
#3. pid = spawn(S3.Processes.Process3, :counter, [])
#4. flush()