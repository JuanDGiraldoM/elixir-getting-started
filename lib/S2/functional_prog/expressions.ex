defmodule S2.DatatypeII.Expressions do
  def reducer_1 do
    list = [1, 2, 3, 4, 5]
    Enum.reduce(list, 0, fn x, acc -> x + acc end)
  end

  def reducer_detailed do
    list = [1, 2, 3, 4, 5]
    IO.inspect(list, label: "List to use")
    result = Enum.reduce(list, 0, fn (n, acc) ->
      IO.inspect(acc, label: "Accumulator")
      IO.inspect(n, label: "List element")
      IO.inspect(n + acc, label: "Product")
    end)
    IO.inspect(result, label: "Result")
  end
  _ = """
  The if statement is an example of a control flow statement, which is used to control the flow of execution in a program.
  Control flow statements do not return a value themselves, but instead modify the behavior of the program.
  On the other hand, expressions are evaluated to produce a value.

  """

  def statement do
    x = IO.gets("Type a number: ") |> String.trim |> String.to_integer
    if x > 5, do: "greater than 5", else: "less than or equal to 5"
  end

  _ = """
  The for expression is an example of a list comprehension, which is a type of expression that can be used to transform lists.
  List comprehensions return a value, which in this case is the new list of doubled even numbers.
  On the other hand, statements such as if and case do not return a value themselves, but instead modify the flow of execution in a program.
  In contrast, expressions evaluate to produce a value that can be used in other expressions or assigned to variables.
  """
  def expression do
    #Comprehesion
    list = [1, 2, 3, 4, 5]
    for n <- list, rem(n, 2) == 0, do: n * 2

  end
end