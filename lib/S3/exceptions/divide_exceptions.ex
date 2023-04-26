defmodule S3.Exceptions.Divide do

  _catch_or_rescue ="""
  In Elixir, catch and rescue are used to handle different types of errors.

  catch is used to catch runtime errors that are thrown as exceptions using throw or exit.
  It's usually used for non-fatal errors, such as when you want to handle a specific error and then continue executing the program.

  rescue is used to handle errors that are raised explicitly with raise/1 or raise/2.
  These errors are usually more serious and indicate that the program can't continue executing as expected.
  rescue is often used to handle unexpected errors, such as network errors or database failures.

  In general, you should use rescue to handle expected errors and catch to handle unexpected errors.
"""

  alias S3.Exceptions.DivZero, as: DivZero

  defp divide(a, b) do
    #if b == 0, do: raise(DivZero), else: a / b
    case {a, b} do
      {_, 0} -> raise(DivZero)
      _ -> a / b
    end
  end

  defp to_integer_ex(u_input) do
    case Integer.parse(u_input) do
      {n, ""} -> {n, :ok}
      :error -> raise(ArgumentError, "Not a integer type")
    end
  end

  def take_input(user_input) when user_input == "" do
    IO.puts("Empty string")
  end

  def take_input(user_input) do
    try do
      #IO.inspect(to_integer_ex(user_input))
      {value, :ok} = to_integer_ex(user_input)
      divide(10, value)
    rescue
      e in DivZero -> IO.puts("Invalid input: #{user_input} - #{e.message}")
      e in ArgumentError -> IO.puts("Invalid input: #{user_input} - #{e.message}")
      _ -> IO.puts("Something went wrong")
    #catch
      #div_zero -> IO.puts("Invalid input: #{user_input} - #{inspect(div_zero)}")
      #arg_error -> IO.puts("Invalid input: #{user_input} - #{inspect(arg_error)}")
      #_ -> IO.puts("Something went wrong")
    after
      IO.puts("Always executes")
    end
  end
end