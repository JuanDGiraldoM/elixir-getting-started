defmodule S3.Genserver.Memory.MemoryServer do
  import S3.Genserver.Memory.MemoryTasks
  use GenServer

  #GenServer stuff
  def init(_param) do
    IO.puts("Memory Game is starting...")
    #To do: Start the main status when process is launch
    #{:ok, status}
  end


  #Decide what handle are going to use: handle_cast, handle_call, or handle_info

  #Main functions
  def init_players() do
    IO.puts("Let's start - Two player memory game")
    p1 = IO.gets("Player 1: ") |> String.trim
    p2 = IO.gets("Player 2: ") |> String.trim

  end

  def start_server do
    #GenServer.start_link(S3.Genserver.Memory.MemoryServer , [])
    GenServer.start_link(__MODULE__ , [], name: MemoryServer)
  end

  def next_turn() do #For player 1

  end

  def next_turn() do #For player 2

  end


end

#c("lib/S3/genserver/memory/memory_server.ex")