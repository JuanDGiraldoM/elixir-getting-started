defmodule S2.FunctionalProg.Recursion do
  _ex= """
  The factorial function is implemented using recursion:

  If n is zero, the function returns 1. This is the base case for the recursion.
  If n is greater than zero, the function multiplies n with the result of calling factorial(n - 1).
  This is the recursive case, where the function calls itself with a smaller argument until it reaches the base case.
"""
  #If x is negative
  def factorial(x) when x < 0, do: :notvalid

  #Base case
  def factorial(0), do: 1

  #Calling recursively
  def factorial(x) when x > 0, do: x * factorial(x - 1)
end