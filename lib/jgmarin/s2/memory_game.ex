defmodule S2.MemoryGame do
  import S2.MemoryUtils
  import S2.StringUtils

  def init() do
    IO.puts("Welcome to Memory Game!")

    nickname = IO.gets("Enter your nickname: ") |> String.trim()
    score = 0
    lives = 4
    board = load_board()

    {status, score} = play(nickname, board, score, lives)
    print_info("\nYou #{status} with #{score} points!")
  end

  defp play(nickname, board, score, lives) when lives > 0 do
    case is_board_ready?(board) do
      true ->
        print_info("You win!")
        {:win, score}
      false ->
        print_status(nickname, score, lives)
        print_board(board)

        [first, second] =
          IO.gets("Select a pair (x,y): ")
          |> String.trim()
          |> String.split(",")
          |> Enum.map(&String.to_integer/1)

        cond do
          first == second ->
            print_warning("You must select two different cells")
            play(nickname, board, score, lives)

          first < 1 or first > 12 or second < 1 or second > 12 ->
            print_warning("You must select a cell between 1 and 12")
            play(nickname, board, score, lives)

          true ->
            {new_board, obtained_score, lost_lives} = play_pair(board, first - 1, second - 1)
            play(nickname, new_board, score + obtained_score, lives - lost_lives)
        end
      end
  end

  defp play(_nickname, _board, score, lives) when lives == 0 do
    print_error("Game over!")
    {:lose, score}
  end

  defp play_pair(board, first, second) do
    played_board = show_cells(board, first, second)
    print_board(played_board)

    first_letter = get_letter(board, first) |> String.downcase()
    second_letter = get_letter(board, second) |> String.downcase()

    cond do
      first_letter == second_letter ->
        if is_vowel?(first_letter) and is_vowel?(second_letter) do
          print_info("You found a pair of vowels!")
          {played_board, 15, 0}
        else
          print_info("You found a pair of consonants!")
          {played_board, 10, 0}
        end
      true ->
        print_error("You didn't find a pair")
        {board, 0, 1}
    end
  end
end
