defmodule S2.FunctionalProg.Functions do
  #A first-order function is a function that takes only data as arguments and returns data as the result.
  def first_order(a, b) do
    IO.inspect( a + b, label: "Result")

  end

  #A higher-order function is a function that takes one or more functions as arguments or returns a function as its result. Here are some examples of higher-order functions in Elixir
  def higher_order do
    # Map function
    list = [1, 2, 3]
    squared = fn x -> x * x end
    result = Enum.map(list, squared)
    IO.inspect(result, label: "Result")
    # result is [1, 4, 9]

    # Filter function
    list = [1, 2, 3, 4, 5]
    is_even = fn x -> rem(x, 2) == 0 end
    result = Enum.filter(list, is_even)
    IO.inspect(result, label: "Result")
    # result is [2, 4]

    # Compose function
    compose = fn f, g -> fn x -> f.(g.(x)) end end
    add_one = fn x -> x + 1 end
    double = fn x -> x * 2 end
    composed_function = compose.(add_one, double)
    result = composed_function.(3)
    IO.inspect(result, label: "Result")
    # result is 7
  end
end