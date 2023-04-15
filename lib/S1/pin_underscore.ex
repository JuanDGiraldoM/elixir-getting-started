defmodule S1.PinUnderscore do
  defp concept do
    """
    The pin operator (^) in Elixir is used to pattern match against a value that has already been assigned to a variable, rather than rebinding the variable to a new value.

    The pin operator is necessary in cases where you want to pattern match against a specific value that is already bound to a variable, rather than pattern matching against
    any value that might be bound to that variable.
    """
    """
    A wildcard character and is often used as a placeholder for variables whose values are not needed.
    It can be used to ignore certain variables or to match any value.
    """
  end

  def pin_example do
    #Example 1
    x = 10

    case 20 do
      x -> IO.puts("Matched #{x}") # In this code, the variable x is defined and assigned the value 10. The case construct introduces a new variable binding for x that matches against the value 20 This will print "Matched 20"
      #^x -> IO.puts("Matched #{x}") #To prevent rebinding and match against the existing value of x, you can use the pin operator. In this code, the ^x pattern matches against the existing value of x (which is 10), so the code will print "No match".
      _ -> IO.puts("No match")
    end
  end

  def pin_underscore do

    #Example 2

    y = 1
    list = [1, 2, 3]

    case list do
      [y, 2, 3] -> IO.puts("Matched!") #will match any list that starts with the value 1, which is the current value of the variable y
      #[^y, 2, 3] -> IO.puts("Matched!") # , if you want to pattern match against the specific value 1 that is already bound to y
      _ -> IO.puts("Not matched!")
    end


  end
end


