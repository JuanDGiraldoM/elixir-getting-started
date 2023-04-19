defmodule S2.Games.Memory.MemoryTasks do

  import S2.Games.Memory.MemoryUtils

  defp selected_letters(map_alphabet)  do
   vowels = get_vowels(map_alphabet, [])
   consonants = get_consonants(map_alphabet, [])
   Enum.concat(vowels, consonants) |> Enum.shuffle()
  end

  def load_game do
    sel_letters = selected_letters(alphabet_map())
    solution = load_board(sel_letters)
    init_game(board(), solution, 4)
  end

  def init_game(init_board, solved_board, lifes) do
    IO.puts(init_board)
    ing_pair = IO.gets("Select a pair (x,y): ") |> String.trim |> String.split(",") |> Enum.map(&String.to_integer/1)
    #To-do
  end



  def output do
    #IO.inspect(alphabet_map())
    #IO.puts(load_board())
    IO.inspect(load_game())
  end


end