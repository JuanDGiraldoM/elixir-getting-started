#Example 1
cond do
  2 + 2 == 5 -> IO.puts "This is not true dude"
  2 - 2 < 0 -> IO.puts "Nor this"
  2 * 2 == 2 + 2 -> IO.puts "But this will"
end


#Example 2
#In this example we will see that it is neccesary to have a default case when none of the conds matches based on the input
a = IO.gets("Type a number a: ") |> String.trim() |> String.to_integer

cond do
  a > 0 -> IO.puts("the number is positive")
  a < 0 -> IO.puts("the number is negative")
  0 -> IO.puts("the number is cero")

end
