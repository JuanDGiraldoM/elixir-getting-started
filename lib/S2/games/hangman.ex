defmodule S2.Games.Hangman do
  def seleccion() do
    palabras = ["mesa", "casa", "mariposa", "lapiz", "vaso", "cafetera"]
    Enum.random(palabras)
  end

  def init_juego() do
    selPal = seleccion()
    espacios = String.duplicate("_", String.length(selPal)-2)
    pal_j = String.first(selPal) <> espacios <> String.last(selPal)
    oport = 0
    juego(pal_j, selPal, oport, initDibujo())
  end

  def juego(palJ, selPal, oport, dib_j) when palJ != selPal and oport < 6 do
    IO.puts(dib_j)
    IO.puts(palJ)
    ingL = IO.gets("Ingrese una letra: ") |> String.trim()
    if String.contains?(selPal, ingL) do
      pal_j = actualizarPalabra(palJ, ingL, selPal)
      juego(pal_j, selPal, oport, dib_j)  #cafetera, cafetera, 4, dibujito
    else
      oport = oport + 1
      dib_j = actualizarDibujo(oport, dib_j)
      juego(palJ, selPal, oport, dib_j)
    end
  end

  def juego(palJ, selPal, _ ,_) when palJ == selPal, do: {:guessed, selPal}

  def juego(_, _, oport, dib_j) when oport == 6, do:  {:gameover, dib_j}

  def actualizarPalabra(palJ, ingL, selPal) do
    mod = modificaciones(selPal, ingL)
    procesar(mod, length(mod), palJ)
  end

  def modificaciones(selPal, ingL) do
    l_selPal = String.codepoints(selPal)
    Enum.filter(Enum.with_index(l_selPal), fn(t) -> elem(t, 0) == ingL end)
  end

  def procesar(l_mods, tot, palJ) when tot > 0 do
    t = Enum.at(l_mods, length(l_mods)-tot)
    act = String.codepoints(palJ)
          |> List.replace_at(elem(t,1), elem(t,0))
          |> Enum.join("")
    tot = tot - 1
    procesar(l_mods, tot, act)
  end

  def procesar(_, 0, act), do: act

  def initDibujo() do
    dibujo = """
      ____
     |    |
     1    |
    324   |
    5 6   |
         _|_
    """
    dibujo
  end

  def actualizarDibujo(oport, dib_j) when oport <= 6 do
    partes = ["O", "|", "/", "\\", "/", "\\"]
    String.replace(dib_j, to_string(oport), Enum.at(partes, oport - 1))
  end

  def actualizarDibujo(oport, dib_j) when oport >= 6 do
    dib_j
  end
end

#{status, result} = S2.Games.Hangman.init_juego
#IO.puts("\n")
#IO.inspect(status)
#IO.puts(result)