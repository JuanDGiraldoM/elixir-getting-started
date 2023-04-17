defmodule S1.Guards do
  def example_1 do
    #Example 1
    number = 42
    case number do
      x when is_integer(x) and x > 50 ->
        IO.puts("#{x} is greater than 50.")
      x when is_integer(x) ->
        IO.puts("#{x} is less than 50.")
      _ ->
        IO.puts("Not an integer.")
    end
  end

  def example_2 do
    #Example 2
    x = 10

    if x > 0 and x < 20 do
      IO.puts("x is between 0 and 20")
    else
      IO.puts("x is not between 0 and 20")
    end
  end

  def example_3 do
    #Example 3
    age = 25

    cond do
      age < 18 -> IO.puts "You are not old enough to vote."
      age >= 18 and age < 21 -> IO.puts "You can vote, but not drink."
      age >= 21 -> IO.puts "You can vote and drink."
    end
  end
end


