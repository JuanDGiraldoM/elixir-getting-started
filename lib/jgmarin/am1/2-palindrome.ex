defmodule Palindrome do
  @moduledoc """
  2. Escribe un programa que utilice la correspondencia de patrones para determinar si una cadena dada es un palíndromo o no.
  (Hay algunas formas de resolverlo, escríbalas todas)

  8. Utilice guardas para comprobar si una cadena dada es un palíndromo.
  """

  @doc """
  If-else
  """
  def palindrome_if_else(word) do
    if word == String.reverse(word) do
      IO.inspect("The word #{word} is palindrome", label: "If-else")
    else
      IO.inspect("The word #{word} isn't palindrome", label: "If-else")
    end
  end

  @doc """
  Conditional
  """
  def palindrome_cond(word) do
    cond do
      word == String.reverse(word) ->
        IO.inspect("The word #{word} is palindrome", label: "Conditional")

      true ->
        IO.inspect("The word #{word} isn't palindrome", label: "Conditional")
    end
  end

  @doc """
  Function with guards
  """
  def palindrome_function(word) when is_binary(word) do
    palindrome_function(word, String.reverse(word))
  end

  defp palindrome_function(word, reverse_word) when word == reverse_word do
    IO.inspect("The word #{word} is palindrome", label: "Function and guards")
  end

  defp palindrome_function(word, _reverse_word) do
    IO.inspect("The word #{word} isn't palindrome", label: "Function and guards")
  end

  @doc """
  Case with guards
  """
  def palindrome_case(word) when is_binary(word) do
    reverse_word = String.reverse(word)

    case word do
      word when word == reverse_word ->
        IO.inspect("The word #{word} is palindrome", label: "Case and guards")

      _ ->
        IO.inspect("The word #{word} isn't palindrome", label: "Case and guards")
    end
  end

  def start do
    word = IO.gets("Enter a word: ") |> String.trim() |> String.downcase()
    palindrome_if_else(word)
    palindrome_cond(word)
    palindrome_function(word)
    palindrome_case(word)
  end
end
