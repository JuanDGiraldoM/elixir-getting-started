defmodule PositivesAndNegatives do
  @moduledoc """
  Escriba un programa que tome un número entero y devuelva
  "Positivo" si el número es positivo,
  "Negativo" si el número es negativo y
  "Cero" si el número es cero.
  """

  @doc """
  If-else
  """
  def check_number_if_else(number) do
    if number > 0 do
      IO.inspect("Positive", label: "If-else")
    else
      if number < 0 do
        IO.inspect("Negative", label: "If-else")
      else
        IO.inspect("Zero", label: "If-else")
      end
    end
  end

  @doc """
  Conditional
  """
  def check_number_cond(number) do
    cond do
      number > 0 ->
        IO.inspect("Positive", label: "Conditional")

      number < 0 ->
        IO.inspect("Negative", label: "Conditional")

      true ->
        IO.inspect("Zero", label: "Conditional")
    end
  end

  @doc """
  Function with guards
  """
  def check_number_function(number) when number > 0 do
    IO.inspect("Positive", label: "Function and guards")
  end

  def check_number_function(number) when number < 0 do
    IO.inspect("Negative", label: "Function and guards")
  end

  def check_number_function(number) when number == 0 do
    IO.inspect("Zero", label: "Function and guards")
  end

  @doc """
  Case with guards
  """
  def check_number_case(number) when is_integer(number) do
    case number do
      number when number > 0 ->
        IO.inspect("Positive", label: "Case and guards")

      number when number < 0 ->
        IO.inspect("Negative", label: "Case and guards")

      _ ->
        IO.inspect("Zero", label: "Case and guards")
    end
  end

  def start do
    number = IO.gets("Enter a number: ") |> String.trim() |> String.to_integer()
    check_number_if_else(number)
    check_number_cond(number)
    check_number_function(number)
    check_number_case(number)
  end
end
