defmodule S2.FunctionalProg.PureFunction do
  def pow(x) do
    :math.pow(x,3) |> round
  end

  def sqrt_3(x) do
    :math.pow(x,1/3) |> round
  end


  def sqrt_2(x) when x < 0, do: :imaginary

  def sqrt_2(x) do
    :math.sqrt(x)
  end
end

