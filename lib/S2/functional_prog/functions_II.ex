defmodule S2.FunctionalProg.FunctionsII do
  def output do
    #Combine alias e import
    alias S2.FunctionalProg.FunctionsI, as: Fun

    import Fun

    IO.inspect(operate(4,3,:+), label: "Combined alias e import to bring this operation")
  end

end


