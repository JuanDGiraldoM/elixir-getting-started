IO.puts("Hello friend, you are programming in Elixir")

"""
How to run hello_there.ex?

No mix:
> elixir lib/S1/hello_there.ex
> elixir -e MyModule.main ---  If your .ex file contains a module 'MyModule' with a 'main' function,

With iex:
iex(n)> c("lib/S1/hello_there.ex")

With mix:
> iex -S mix


Recompilation

No mix:
elixirc lib/S1/hello_there.ex

With iex:
iex(n)> c("lib/S1/hello_there.ex") --- checks if there are changes

With mix:
> iex -S mix
> recompile  :ok | :noop

"""
