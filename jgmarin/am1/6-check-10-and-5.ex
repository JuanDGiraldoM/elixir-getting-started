defmodule CheckNumber do
  @moduledoc """
  Utilice el flujo de control cond para comprobar si una variable x es mayor que 10, menor que 5, o entre 5 y 10.
  Si lo es, imprima "x es mayor que 10",
  en caso contrario imprima "x es menor o igual que 10".
  Imprima "x es mayor que 10", "x es menor que 5", o "x está entre 5 y 10" dependiendo del valor de x.
  """

  def checkNumberLimit(number, upper_limit, lower_limit) do
    cond do
      number > upper_limit -> IO.puts("#{number} es mayor que #{upper_limit}")
      number < lower_limit -> IO.puts("#{number} es menor que #{lower_limit}")
      true -> IO.puts("#{number} está entre #{lower_limit} y #{upper_limit}")
    end
  end

end

number = IO.gets("Enter a number: ") |> String.trim() |> String.to_integer()
CheckNumber.checkNumberLimit(number, 10, 5)
