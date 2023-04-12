defmodule CheckNumber do
  @moduledoc """
  Utiliza el flujo de control if/else para comprobar si una variable x es mayor que 10.
   Si lo es, imprime "x es mayor que 10",
   de lo contrario imprime "x es menor o igual que 10".
  """

  def checkNumberLimit(number, limit) do
    if number > limit do
      IO.puts("#{number} es mayor que #{limit}")
    else
      IO.puts("#{number} es menor o igual que #{limit}")
    end
  end

end

number = IO.gets("Enter a number: ") |> String.trim() |> String.to_integer()
CheckNumber.checkNumberLimit(number, 10)
