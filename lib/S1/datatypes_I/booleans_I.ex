defmodule S1.DatatypesI.Booleans_I do
  def outputs do
    IO.puts("true? #{is_boolean(true)}")
    IO.puts("\"true\"? #{is_boolean("true")}")
    IO.puts("false? #{is_boolean(false)}")
  end

  def non_strict_examples do
    v = :yay
    w = nil
    x = 1
    y = false
    z = true

    # Non-strict equality operator - all true
    IO.puts("Non-strict equality operator")
    IO.puts("#{v == :yay}")
    IO.puts("#{w == nil}")
    IO.puts("#{x == 1}")
    IO.puts("#{y == false}")
    IO.puts("#{z == true}")

    # Non-strict inequality operator
    IO.puts("\nNon-strict inequality operator")
    # false
    IO.puts("#{v != :nay}")
    # true
    IO.puts("#{w != :foo}")
    # false
    IO.puts("#{x != 0}")
    # false
    IO.puts("#{y != true}")
    # false
    IO.puts("#{z != false}")

  end

  def strict_examples do
    v = :yay
    w = nil
    x = 1
    y = false
    z = true

    # Strict equality operator - all true
    IO.puts("\nStrict equality operator")
    IO.puts("#{v === :yay}")
    IO.puts("#{w === nil}")
    IO.puts("#{x === 1}")
    IO.puts("#{y === "false"}")
    IO.puts("#{z === true}")

    # Strict inequality operator
    IO.puts("\nStrict inequality operator")
    # false
    IO.puts("#{v !== :nay}")
    # true
    IO.puts("#{w !== :foo}")
    # false
    IO.puts("#{x !== 0}")
    # false
    IO.puts("#{y !== true}")
    # false
    IO.puts("#{z !== false}")

  end

  def logical_operators do
    v = :yay
    w = nil
    x = 1
    y = false
    z = true


    # Logical operators -all true
    IO.puts("\nLogical operators")
    IO.puts("#{x == 1 && y == false}")
    IO.puts("#{y || z}")
    IO.puts("#{!(w || z)}")
  end
end






