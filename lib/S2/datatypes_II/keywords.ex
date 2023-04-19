defmodule S2.DatatypesII.Keyword do

  _ = """
    In Elixir, a keyword is a list of tuples where the first element of each tuple is an atom (a constant with a name) and the second element is any Elixir term.
    Keywords are commonly used for passing options and named parameters to functions.

    One key difference between maps and keywords is that maps can have any type of key, while keywords can only have atoms and strings as keys.
    Maps are also more efficient for large data sets and provide more functionality, such as the ability to pattern match on them and use them as function arguments.
    Keywords, on the other hand, are commonly used as options lists or for passing named arguments to functions. They are often more convenient to write than maps,
    especially for small data sets, and can be easily converted to maps using the Keyword.to_map/1 function.

    To access the value associated with the name key in the user_map, we can use the map access syntax user_map[:name], which returns the value "John".
    To access the value associated with the name key in the user_keyword, we can use the Keyword.get/2 function, which returns the value "John".
  """

  #Example 0
  def simple_keyword do
    user_keyword = [:name, "John", :age, 30]
    IO.inspect(user_keyword[:name], label: "Value of atom :name #1")
    IO.inspect(Keyword.get(user_keyword, :name), label: "Value of atom :name #2")
  end

  #Example 1: Default parameter
  def say_hello(name: "world"), do: "Hello, #{:name}!"

  _ = """
  A function my_function that takes an argument arg and an optional keyword argument options with a default value of an empty keyword list.
  The function retrieves the value of the my_option key from the options list using the Keyword.get/3 function with a default value of "default_value".
  The function then does something with arg and option_value. Finally, we call the my_function function with the argument "foo" and an options keyword list containing the my_option key with a value of "bar".
  """
  #Example 2
  def my_function(_arg, options \\ []) do
    option_value = Keyword.get(options, :my_option, "default_value")
    IO.inspect(option_value, label: "Example 2 option_value")
  end
end