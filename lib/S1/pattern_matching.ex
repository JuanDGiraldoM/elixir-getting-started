defmodule S1.PatternMatching do
  def even_odd_1 do
    #Using pattern matching, write a program to test whether a given number is even or odd.
    number_in = IO.gets("Type a number: ") |> String.trim |> String.to_integer

    #Solution 1
    case rem(number_in, 2) do
      0 ->
        IO.puts("It is an even number")
      _ ->
        IO.puts("It is an odd number")
    end
  end

  def even_odd_2 do
    number_in = IO.gets("Type a number: ") |> String.trim |> String.to_integer
    #Solution 2
    cond do
      rem(number_in,2) == 0 -> IO.puts("It is an even number")
      rem(number_in,2) !== 0 -> IO.puts("It is an odd number")
    end
  end

  def even_odd_3 do
    number_in = IO.gets("Type a number: ") |> String.trim |> String.to_integer

    #Solution 3
    with is_odd <- rem(number_in,2) == 0,
         true <- is_odd do
      IO.puts("It is an even number")
    else
      _ -> IO.puts("It is an odd number")

    end
  end

  def even_odd_4 do
    number_in = IO.gets("Type a number: ") |> String.trim |> String.to_integer
    if (rem(number_in,2) == 0), do: IO.puts("It is an even number"), else: IO.puts("It is an odd number")
  end

  def palindrome do
    #Write a program that uses pattern matching to determine whether a given string is a palindrome or not.

    text_in = IO.gets("Type a word: ") |> String.trim

    #Solution 1
    case String.reverse(text_in) do
      "" ->
        IO.puts("The string is empty")
      ^text_in ->
        IO.puts("It is palindrome")
      _ ->
        IO.puts("Not a palindrome")
    end
  end
end

