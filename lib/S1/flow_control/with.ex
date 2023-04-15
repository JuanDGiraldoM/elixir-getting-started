defmodule S1.FlowControl.With do
  def example_1 do
    #A simple example
    a = IO.gets("Type a number: ") |> String.trim() |> String.to_integer

    #with a when a > 0 <- a do
    #        :positive
    #        else
    #          0 -> :zero
    #          _ -> :negative
    #        end

    _ex1 = """
    In this example, the with block attempts to perform three square root calculations in succession.
    However, the first calculation will fail since the square root of a negative number is undefined.
    This means that the pattern match {:ok, a} <- :math.sqrt(-1) will fail, causing the entire with
    block to immediately return with the error value {:error, reason}. This will trigger the else clause,
    which will print an error message containing the reason for the failure.
    """
    #THis is how it works
    #with a when a >= 0 <- a,
    #Si la guarda se cumple, el valor después de '<-' se pone en la variable
    #Si el resultado de la guarda da falso, enseguida va al else
    with a when a >= 0 <- a,
         b  <- :math.sqrt(a),
         c  <- :math.sqrt(b) do
      IO.puts("The result is #{c}")
    else
      _ -> IO.puts("Error: Negative number #{a}")
    end

    #with is_negative <- a < 0,
    #    true <- is_negative do
    #     IO.puts("Error: Negative number #{a}")
    #    else
    #      _ -> IO.puts("#1 The result is #{:math.sqrt(a)}")
    #    end

    #A with ft else 1
    #a = 4
    #b = 25
    #c =1
  end

  def example_2 do
    _ex2 = """
    In this example, the with block attempts to perform three square root calculations in succession.
    However, the first calculation will fail since the square root of a negative number is undefined.
    This means that the pattern match {:ok, a} <- :math.sqrt(-1) will fail, causing the entire with
    block to immediately return with the error value {:error, reason}. This will trigger the else clause,
    which will print an error message containing the reason for the failure.
    """
    with a <- :math.sqrt(1), #{:ok, a} <- :math.sqrt(1)
         b <- :math.sqrt(a),
         c <- :math.sqrt(b) do
      IO.puts("#2 The result is #{c}")
    else
      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end

  end

  def example_3 do
    _ex3 = """
    In this example, the with block attempts to perform two square root calculations, and then add their results together.
    However, the addition operation will fail if either a or b is not a number. If this happens, the entire with block will
    return with a non-matching value, triggering the else clause which simply prints an error message.
    """
    with a <- :math.sqrt(4),
         b <- :math.sqrt(16),
         c = a + b do
      IO.puts("#3 The result is #{c}")
    else
      _ ->
        IO.puts("Error: Could not perform calculation")
    end
  end

  def example_4 do
    _ex4 = """
    In this example, the with block attempts to perform three square root calculations, and then add their results together.
    However, if any of the calculations fail, the with block will return with the error value {:error, reason},
    which triggers the else clause. The else clause contains two pattern matches: one for the specific error {:error, "Bad number"},
    and one for any other error ({:error, _}). If the error is the specific error "Bad number", the else clause will print a more specific error message.
    If the error is anything else, the else clause will print a generic error message.
    """
    with a <- :math.sqrt(4),
         b <- :math.sqrt(16),
         c <- :math.sqrt(1) do
      IO.puts("#4 The result is #{a + b + c}")
    else
      {:error, "Bad number"} ->
        IO.puts("Error: Could not perform calculation due to bad number")
      {:error, _} ->
        IO.puts("Error: Could not perform calculation")
    end
  end
end
