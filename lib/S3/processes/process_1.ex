defmodule S3.Processes.Process1 do
  #Concurrency: When your pc is able to do many tasks at the same time

  def greet(name) do
    IO.puts("Hello, #{name}")
  end

  def infinite, do: infinite()
end

#To execute once it is compiled: iex > c("route/when/file/exists.ex") : We do like this just to recompile this specific file and not everything
#pid = spawn(Module, :functionToRun, [args that :funtionToRun needs])  -- primitive: To evaluate what you call in a new process.
#i pid


#Check if the process is alive
#Process.alive?(process)

#Check info about the running process
#Process.info(process)


#Set a name for the process
#Process.register(process, :name)



