defmodule S2.Games.Memory.MemoryTasks do

  import S2.Games.Memory.MemoryUtils

  defp selected_letters(map_alphabet)  do
   vowels = get_vowels(map_alphabet, [])
   consonants = get_consonants(map_alphabet, [])
   Enum.concat(vowels, consonants) |> Enum.shuffle()
  end

  def init_game do
    sel_letters = selected_letters(alphabet_map())
    solution = load_board(sel_letters, alphabet_map())
    player = IO.gets("Enter a nickname: ") |> String.trim
    game(board(), solution, player, 4, 0)
  end

  defp game(board_on, solved_board, player, lifes, score) when lifes > 0 and score < 75  do
    #solved_board contains the correct pairs and the location per letter so, we separate them into two variables
    correct_pairs = elem(solved_board, 0)
    IO.inspect(correct_pairs, label: "Correct pairs")
    letter_pos = elem(solved_board, 1)

    #Showing info of the game
    IO.puts("Player: #{player}")
    IO.puts("Lifes: #{lifes}")
    IO.puts("Score: #{score}")
    IO.puts(board_on)

    #Ask for input a pair: For the game it is the same {1,2} and {2,1} but for the map stored in correct_pairs not. So i must have both option and specify that they are the same in this context more ahead
    ing_pair = IO.gets("Select a pair (x,y): ")
               |> String.trim
               |> String.split(",")
               |> Enum.map(&String.to_integer/1)
               |> List.to_tuple

    #The reversed coordenates
    ing_pair_r = ing_pair |> Tuple.to_list |> Enum.reverse |> List.to_tuple

    #Here i filter in order to obtain the letter and its position to set in the reveal_card
    {pair1, pair2} = Enum.filter(letter_pos, fn {_k,v} -> v ==  elem(ing_pair, 0) or v == elem(ing_pair, 1) end)
                    |> Enum.map(fn t -> {elem(t, 0), elem(t,1)} end ) |> List.to_tuple

    #Show the cards selected
    IO.puts(reveal_cards(board_on, pair1, pair2))

    #The existence in the correct_pairs map bc if it is there that means it can be a pair of vowels or a pair of consonants
    exists_pair = ing_pair in Map.keys(correct_pairs) or ing_pair_r in Map.keys(correct_pairs)

    lifes = unless exists_pair , do: lifes - 1, else: lifes

    board_on = if exists_pair, do: reveal_cards(board_on, pair1, pair2), else: board_on

    {score, msg} = case get_key_map(correct_pairs, ing_pair, ing_pair_r) do
      {_, _, :vowel, :notfound} -> {score + 15, "You found a vowel!"}
      {_, _, :consonant, :notfound} -> {score + 10, "You found a consonant!"}
      {_, _, _, :found} -> {score, "Already found"}
      nil -> {score, "Not a pair, try again"}
    end

    IO.puts(msg)

    correct_pairs = unless is_nil(get_key_map(correct_pairs, ing_pair, ing_pair_r)), do: get_and_update(correct_pairs, ing_pair,ing_pair_r), else: correct_pairs

    game(board_on, {correct_pairs, letter_pos}, player, lifes, score)
  end

  defp game(_, _, _, lifes, score) when lifes == 0, do: {:gameover, score }

  defp game(_, _, _, _, score), do: {:winner, score}

  defp reveal_cards(board_on, pair1, pair2) do
      p1 = to_string(elem(pair1, 1))
      p2 = to_string(elem(pair2, 1))
      String.replace(board_on, "-"<>p1<>"-", elem(pair1, 0)) |> String.replace("-"<>p2<>"-", elem(pair2,0))

  end

  defp get_key_map(correct_pairs, ing_pair, ing_pair_r) do
    case Map.has_key?(correct_pairs, ing_pair) do
      true -> Map.get(correct_pairs, ing_pair)
      false -> Map.get(correct_pairs, ing_pair_r)
    end
  end

  defp get_and_update(correct_pairs, ing_pair, ing_pair_r) do
    value = get_key_map(correct_pairs, ing_pair, ing_pair_r)
    case Map.has_key?(correct_pairs, ing_pair)  do
      true -> Map.replace(correct_pairs, ing_pair, {elem(value, 0), elem(value, 1), elem(value, 2), :found})
      false -> Map.replace(correct_pairs, ing_pair_r,{elem(value, 0), elem(value, 1), elem(value, 2), :found})
    end
  end

end