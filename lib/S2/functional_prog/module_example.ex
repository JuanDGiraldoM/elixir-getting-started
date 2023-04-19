defmodule S2.FunctionalProg.Modules do
  def output do
    #Usage of alias
    alias Enum, as: E

    E.uniq([1,2,2,1,2,3])

    #Usage of import
    #When you import you have to compile the module to be imported in order to make it available

    #Two ways:

    #elixirc lib/S2/functional_prog/functions_I.ex
    #iex - c("lib/S2/functional_prog/functions_I.ex")
    #c("lib/S2/functional_prog/functions_II.ex")

    #import S2.FunctionalProg.FunctionsI
    import S2.FunctionalProg.FunctionsI, only: [operate: 3]

    IO.inspect(operate(4,5, :+), label: "Result")
    #IO.inspect(sum_nums(4,5), label: "This is an error")
  end

end
