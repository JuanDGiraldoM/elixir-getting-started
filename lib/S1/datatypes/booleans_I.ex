v = :yay
w = nil
x = 1
y = false
z = true

IO.puts("true? #{is_boolean(true)}")
IO.puts("\"true\"? #{is_boolean("true")}")
IO.puts("false? #{is_boolean(false)}")

# Non-strict equality operator - all true
IO.puts("Non-strict equality operator")
IO.puts("#{v == :yay}")
IO.puts("#{w == nil}")
IO.puts("#{x == 1}")
IO.puts("#{y == false}")
IO.puts("#{z == true}")

# Strict equality operator - all true
IO.puts("\nStrict equality operator")
IO.puts("#{v === :yay}")
IO.puts("#{w === nil}")
IO.puts("#{x === 1}")
IO.puts("#{y === "false"}")
IO.puts("#{z === true}")

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

# Logical operators -all true
IO.puts("\nLogical operators")
IO.puts("#{x == 1 && y == false}")
IO.puts("#{y || z}")
IO.puts("#{!(w || z)}")
