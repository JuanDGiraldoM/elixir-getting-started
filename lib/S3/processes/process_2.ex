defmodule S3.Processes.Process2 do
  #To execute once it is compiled: iex -S mix > c("route/when/file/exists.ex") : We do like this just to recompile this specific file and not everything

  #On process_1.ex you learnt to launch a process, show what it does and finally finished it/killed it at instant
  #receive: I want that when i launch the process check its inbox if something has arrived - Has a same behavior as case bc pattern matching
  #When the process get launched, it freezes until something arrives to its inbox
  def messages_received do
    receive do
      {sender_pid, msg} -> IO.puts("Received msg: #{msg} from pid #{inspect(sender_pid)}")
    end
  end

  def greet do
    receive do
      name -> IO.puts("Hey, #{name}") #If you set expressions wout IO.puts or inspect it will do nothing in the console
    end
  end

  def greet_2 do
    receive do
      #Here we send a message to the pid sent when we send something once the process is launched
      {pid, name} -> send(pid, IO.puts("Greetings, #{name} from process #{inspect(pid)}"))
    end
    greet_2()
  end

  #To send something to the process
  #send(pid, {self(), "Hey~"})

  #Check if the process is alive
  #Process.alive?(process)

  #Check info about the running process - if the process finishes, this will return nil
  #Process.info(process)
end
