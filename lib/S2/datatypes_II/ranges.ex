defmodule S2.DatatypesII.Ranges do

    _ = """
    e define a function sum_range/2 that takes two arguments, from and to, which represent the starting and ending values of a range of integers. The function calculates the sum of all the integers in the range using the Enum.sum/1 function.

    The function definition includes a guard clause that checks if from is less than or equal to to. If from is greater than to, the function will not calculate the sum and will instead return nil.
"""
    def sum_range(from, to) when from <= to do
      Enum.sum(from..to)

    end
end