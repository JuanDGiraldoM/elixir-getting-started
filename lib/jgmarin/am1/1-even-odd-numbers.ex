defmodule EvenAndOdd do
  @moduledoc """
  Utilizando la correspondencia de patrones, escribe un programa para comprobar si un número dado es par o impar.
  (Hay algunas formas de resolverlo, escríbalas todas)
  """

  @doc """
  If-else
  """
  def even_odd_if_else(number) do
    if rem(number, 2) == 0 do
      IO.inspect("The number #{number} is even", label: "If-else")
    else
      IO.inspect("The number #{number} is odd", label: "If-else")
    end
  end

  @doc """
  Conditional
  """
  def even_odd_cond(number) do
    cond do
      rem(number, 2) == 0 ->
        IO.inspect("The number #{number} is even", label: "Conditional")

      true ->
        IO.inspect("The number #{number} is odd", label: "Conditional")
    end
  end

  @doc """
  Function with guards
  """
  def even_odd_function(number) when rem(number, 2) == 0 do
    IO.inspect("The number #{number} is even", label: "Function and guards")
  end

  def even_odd_function(number) do
    IO.inspect("The number #{number} is odd", label: "Function and guards")
  end

  @doc """
  Case with guards
  """
  def even_odd_case(number) when is_integer(number) do
    case number do
      number when rem(number, 2) == 0 ->
        IO.inspect("The number #{number} is even", label: "Case and guards")

      _ ->
        IO.inspect("The number #{number} is odd", label: "Case and guards")
    end
  end
end

number = IO.gets("Enter a number: ") |> String.trim() |> String.to_integer()
EvenAndOdd.even_odd_if_else(number)
EvenAndOdd.even_odd_cond(number)
EvenAndOdd.even_odd_function(number)
EvenAndOdd.even_odd_case(number)
