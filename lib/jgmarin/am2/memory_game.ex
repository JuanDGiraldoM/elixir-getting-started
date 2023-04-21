defmodule AM2.MemoryGame do
  import AM2.MemoryUtils
  import AM2.StringUtils

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
    {%{letter: first_letter, hide: first_hide}, _} = get_cell(board, first)
    {%{letter: second_letter, hide: second_hide}, _} = get_cell(board, second)

    case !(first_hide && second_hide) do
      true ->
        print_error("You must select two hidden cells")
        {board, 0, 0}

      _ ->
        played_board = show_cells(board, first, second)
        print_board(played_board)

        first_letter_down = first_letter |> String.downcase()
        second_letter_down = second_letter |> String.downcase()

        case first_letter_down == second_letter_down do
          true ->
            {played_board, get_score(first_letter_down), 0}

          _ ->
            print_error("You didn't find a pair")
            {board, 0, 1}
        end
    end
  end

  defp get_score(letter) do
    case is_vowel?(letter) do
      true ->
        print_info("You found a pair of vowels!")
        15

      false ->
        print_info("You found a pair of consonants!")
        10
    end
  end
end
