defmodule Greetings do
  @moduledoc """
  Crea un mapa con las claves "nombre", "edad" y "ciudad".
  Utiliza la función Map.get/3 para obtener el valor de "nombre" e imprime "¡Hola {nombre}!".
  """

  def greetings(map) do
    name = Map.get(map, :name)
    IO.puts("Hello #{name}!")
  end
end

map = %{name: "Juan", age: 30, city: "Itagüí"}
Greetings.greetings(map)
