defmodule S1.DatatypesI.Integers do
  defp concept do
    """
    A variable is bound when it has been assigned a value.
    This means that the variable is associated with a value in memory, and can be used in subsequent computations.
    Once a variable has been bound to a value, the value cannot be changed; the variable can only be rebound to a new value.
    """
  end

  def basic_output do
    # Integers
    #int_1 = 1
    #int_2 = 234
    int_3 = 567_890

    IO.puts("The variable int_1 is bound #{int_1}.")
    IO.puts("Truly an integer? #{is_integer(int_3)}")

    IO.puts("The variable int_2 is bound #{int_2}.")
    IO.puts("Truly an integer? #{is_integer(int_2)}")

    IO.puts("The variable int_3 is bound #{int_3}.")
    IO.puts("Truly an integer? #{is_integer(int_3)}")
  end

  def operations do
    # Operations
    # add
    IO.puts("10 + 2 = #{10 + 2}")
    IO.puts("10.75 + 3.25 = #{10.75 + 3.25}")

    # substract right from left
    IO.puts("10 -2 = #{10 - 2}")
    IO.puts("10.75 - 3.25 = #{10.75 - 3.25}")

    # multiply
    IO.puts("10.75 * 3.25 = #{10.75 * 3.25}")

    # Divide left by right and return float
    IO.puts("10 / 2 = #{10 / 2}")

    # Divide left by right and return integer
    IO.puts("div(10/3) = #{div(10, 3)}")

    # Remainder
    IO.puts("rem(10,3) = #{rem(10, 3)}")
  end


end





