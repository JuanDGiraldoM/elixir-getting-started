defmodule Greetings do
  @moduledoc """
  Cree un patrón que coincida con un mapa con las claves :nombre, :edad y :ciudad.
  Si :nombre es "Juan", imprime "¡Hola Juan de {ciudad}!",
  en caso contrario imprime "¡Encantado de conocerte!".
  """

  @doc """
  If-else
  """
  def greetings_if_else(%{name: name, age: _age, city: city}) do
    if name == "Juan" do
      IO.inspect("Hello #{name}, from #{city}", label: "If-else")
    else
      IO.inspect("Nice to meet you!", label: "If-else")
    end
  end

  @doc """
  Conditional
  """
  def greetings_cond(%{name: name, age: _age, city: city}) do
    cond do
      name == "Juan" ->
        IO.inspect("Hello #{name}, from #{city}", label: "Conditional")

      true ->
        IO.inspect("Nice to meet you!", label: "Conditional")
    end
  end

  @doc """
  Function with guards
  """
  def greetings_function(%{name: name, age: _age, city: city}) when name == "Juan" do
    IO.inspect("Hello #{name}, from #{city}", label: "Function and guards")
  end

  def greetings_function(_map) do
    IO.inspect("Nice to meet you!", label: "Function and guards")
  end

  @doc """
  Case with guards
  """
  def greetings_guard_case(%{name: name, age: _age, city: city}) do
    case name do
      name when name == "Juan" ->
        IO.inspect("Hello #{name}, from #{city}", label: "Case and guards")

      _ ->
        IO.inspect("Nice to meet you!", label: "Case and guards")
    end
  end
end

map = %{name: "Maria", age: 30, city: "Itagüí"}
Greetings.greetings_if_else(map)
Greetings.greetings_cond(map)
Greetings.greetings_function(map)
Greetings.greetings_guard_case(map)
