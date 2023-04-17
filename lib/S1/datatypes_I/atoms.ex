defmodule S1.DatatypesI.Atom do
  def atoms do
    a = :hello

    IO.puts(:this_is_atomic)

    IO.puts("Are you an atom: ? #{is_atom(a)}")


  end


end
