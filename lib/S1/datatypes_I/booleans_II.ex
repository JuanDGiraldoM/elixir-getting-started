defmodule S1.DatatypesI.Booleans_II do
  def operators do
    # Example 1
    a = true
    b = false
    c = nil

    # Using the `or` operator
    # true
    IO.puts(a or b)
    # nil
    IO.puts(b or c)

    # Using the `and` operator
    # false
    IO.puts(a and b)
    # false
    IO.puts(b and c)

    # Using the `&&` operator
    # false
    IO.puts(a && b)
    # false
    IO.puts(b && c)

    # Using the `||` operator
    # true
    IO.puts(a || b)
    # nil3
    IO.puts(b || c)

    # Using the `not` operator
    # false
    IO.puts(not a)
    # true
    IO.puts(not b)
    #IO.puts not c  # error
  end
end

