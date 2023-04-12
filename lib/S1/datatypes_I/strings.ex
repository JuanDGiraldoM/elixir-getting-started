# Strings

w = "wizard"
a = "AlcHeMY"
i = "caster oil"

IO.puts(<<10>>)
IO.puts("Concatenation: Wise " <> w)
IO.puts("Captitalize #{w}: #{String.capitalize(w)}")
IO.puts("Downcase #{a}: #{String.downcase(a)}")
IO.puts("Upcase #{a}: #{String.upcase(a)}")
IO.puts("Does #{i} contain oil? #{String.contains?(i, "oil")}")
IO.puts("Does #{i} contain peanuts? #{String.contains?(i, "peanuts")}")
IO.puts("First grapheme of #{w}: #{String.first(w)}")
IO.puts("Last grapheme of #{w}: #{String.last(w)}")
IO.inspect(String.split(i), label: "Split #{i}")
IO.puts("Is a string? #{is_binary(i)}")
IO.puts(<<10>>)
