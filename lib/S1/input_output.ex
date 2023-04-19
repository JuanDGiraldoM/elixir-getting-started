defmodule S1.InOut do
  _ = """
  Did I have to know something extra about IO.gets/1 or IO.puts

  IO.gets/1 function reads a line of input from standard input (usually the terminal) as a string.
  It takes an optional argument that specifies a prompt to be displayed before waiting for input.

  IO.puts/1 function writes a string to standard output (usually the terminal) followed by a newline character.
  It takes one argument, which is the string to be printed.

  **Keep in mind is that IO.gets/1 reads input as a string attaching a \n, so you may need to convert it to another data type (e.g. integer or float)
  if you need to perform numerical operations on it. Additionally, you should be careful when using IO.gets/1 in a loop, as it will block until
  input is received, which may cause your program to hang if input is not provided. It's a good practice to provide clear instructions to the
  user on what input is expected to avoid this issue.

  """
  def output do
    name = IO.gets("What's your name? ") |> String.trim
    IO.puts("Hello #{name}, nice yo meet you")
  end


end


