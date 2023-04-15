defmodule S1.FlowControl.IfElse do
  def ifs_examples do
    # A single if
    age = 18

    if age >= 18 do
      IO.puts("You are old enough to vote.")
    end

    # An if-else
    if age >= 18 do
      IO.puts("You are old enough to vote.")
    else
      IO.puts("You are not old enough to vote.")
    end

    # An if-else-if-else
    number = 7

    if number < 5 do
      IO.puts("The number is less than 5.")
    else
      if number > 10 do
        IO.puts("The number is greater than 10.")
      else
        IO.puts("The number is between 5 and 10.")
      end
    end

    # In a single line: if-else
    x = 5
    message = if x > 10, do: "x is greater than 10", else: "x is less than or equal to 10"
    IO.puts(message)

  end
end
