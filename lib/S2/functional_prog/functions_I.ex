defmodule S2.FunctionalProg.FunctionsI do
  def sum_nums(n1, n2) do
    n1 + n2
  end

  def subs_nums(n1,n2) do
    n1 - n2
  end

  def mult_nums(n1,n2) do
    n1 * n2
  end

  #Same functionality, but separating into specific cases
  #Always the functions with guards come before the original that usually don't have guards
  def div_nums(_, n2) when n2 == 0, do: :infinity

  def div_nums(n1, _) when n1 == 0, do: 0

  def div_nums(n1, n2) do
    n1 / n2
  end

  #Another approach: Single function but making the operation based in pattern matching
  def operate(n1, n2, op) do
    case op do
      :+ -> n1 + n2
      :- -> n1 - n2
      :x -> n1 * n2
      :/ when n2 != 0 or n1 == 0 -> n1 / n2
      _ -> :infinity
    end
  end

  def output do
    alias S2.FunctionalProg.FunctionsI, as: Functions_I

    x = IO.gets("N1: ") |> String.trim |> String.to_integer()
    y = IO.gets("N2: ") |> String.trim |> String.to_integer()

    IO.puts("Each function")
    IO.inspect(Functions_I.sum_nums(x,y), label: "Result of sum_nums")
    IO.inspect(Functions_I.subs_nums(x,y), label: "Result of subs_nums")
    IO.inspect(Functions_I.mult_nums(x,y), label: "Result of mult_nums")
    IO.inspect(Functions_I.div_nums(x,y), label: "Result of div_nums")
    IO.puts ""
    IO.puts("Using Operate")
    IO.inspect(Functions_I.operate(x,y, :+), label: "Result")
    IO.inspect(Functions_I.operate(x,y, :-), label: "Result")
    IO.inspect(Functions_I.operate(x,y, :x), label: "Result")
    IO.inspect(Functions_I.operate(x,y, :/), label: "Result")
  end
end



