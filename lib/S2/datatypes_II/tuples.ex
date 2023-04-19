defmodule S2.DatatypesII.Tuples do
  #Simulate an object
  def new(name, age) do
    {:person, name, age}
  end

  def get_name({:person, name, _age}) do
    name
  end

  def get_age({:person, _name, age}) do
    age
  end

  #To set matching values returns
  def divide(a, b) do
    if b == 0 do
      {:error, "division by zero"}
    else
      {:ok, a / b}
    end
  end
end