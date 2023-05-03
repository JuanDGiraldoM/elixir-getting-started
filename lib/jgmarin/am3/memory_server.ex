defmodule AM3.MemoryServer do
  use GenServer
  import AM2.MemoryUtils
  import AM2.StringUtils

  def start_game() do
    GenServer.start(__MODULE__, [], name: __MODULE__)
    print_game_state()
  end

  def print_game_state(), do: send(__MODULE__, :state)
  def check_game_status(), do: GenServer.call(__MODULE__, :game_status)

  def next_turn() do
    GenServer.call(__MODULE__, :play, :infinity)
    check_game_status()
  end

  defp play(player = %{nick_name: nick_name, lives: lives, score: score}, board) when lives > 0 do
    print_info("\n-> Player #{nick_name} turn!")

    [first, second] =
      IO.gets("-> Select a pair (x,y): ")
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    cond do
      first == second ->
        print_warning("You must select two different cells")
        play(player, board)

      first < 1 or first > 12 or second < 1 or second > 12 ->
        print_warning("You must select a cell between 1 and 12")
        play(player, board)

      true ->
        {new_board, obtained_score, lost_lives} = play_pair(board, first - 1, second - 1)
        IO.puts("Remaining lives: #{lives - lost_lives}")
        {%{player | score: score + obtained_score, lives: lives - lost_lives}, new_board}
    end
  end

  defp play_pair(board, first, second) do
    {%{letter: first_letter, hide: first_hide}, _} = get_cell(board, first)
    {%{letter: second_letter, hide: second_hide}, _} = get_cell(board, second)

    case !(first_hide && second_hide) do
      true ->
        print_error("You must select two hidden cells")
        {board, 0, 0}

      _ ->
        print_board(show_cells(board, first, second))

        first_letter_down = first_letter |> String.downcase()
        second_letter_down = second_letter |> String.downcase()

        case first_letter_down == second_letter_down do
          true ->
            print_game_state()
            {unlock_cells(board, first, second), get_score(first_letter_down), 0}

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

  defp finish_game(%{player_1: player1, player_2: player2}) do
    %{nick_name: nickname1, score: score1, lives: lives1} = player1
    %{nick_name: nickname2, score: score2, lives: lives2} = player2

    cond do
      score1 > score2 ->
        print_info("--> Player #{nickname1} wins with #{score1} points!")

      score2 > score1 ->
        print_info("--> Player #{nickname2} wins with #{score2} points!")

      score1 == score2 ->
        print_warning("--> It's a points tie!")

        cond do
          lives1 > lives2 -> print_info("--> Player #{nickname1} wins with #{lives1} lives!")
          lives2 < lives1 -> print_info("--> Player #{nickname2} wins with #{lives2} lives!")
          true -> print_warning("--> It's a lives tie!")
        end
    end
  end

  # Server callbacks

  @impl true
  def init(_params) do
    IO.puts("Welcome to Memory Game!")

    nick_name1 = IO.gets("Enter player_1 nickname: ") |> String.trim()
    nick_name2 = IO.gets("Enter player_2 nickname: ") |> String.trim()

    player_1 = %{nick_name: nick_name1, lives: 4, score: 0}
    player_2 = %{nick_name: nick_name2, lives: 4, score: 0}
    board = load_board()

    state = %{board: board, player_1: player_1, player_2: player_2, turn: :player_1, round: 1}
    {:ok, state}
  end

  @impl true
  def handle_call(
        :play,
        _from,
        state = %{board: board, player_1: player_1, player_2: player_2, turn: turn, round: round}
      ) do
    IO.puts("-> Round ##{round}")

    case turn == :player_1 do
      true ->
        {player1, new_board} = play(player_1, board)
        new_turn = :player_2

        {:reply, :ok,
         %{state | board: new_board, turn: new_turn, player_1: player1, round: round + 1}}

      false ->
        {player2, new_board} = play(player_2, board)
        new_turn = :player_1

        {:reply, :ok,
         %{state | board: new_board, turn: new_turn, player_2: player2, round: round + 1}}
    end
  end

  @impl true
  def handle_call(
        :game_status,
        _from,
        state = %{player_1: player1, player_2: player2, board: board}
      ) do
    case is_board_ready?(board) || player1.lives == 0 || player2.lives == 0 do
      true ->
        {:stop, :game_over, state}

      false ->
        {:reply, :ok, state}
    end
  end

  @impl true
  def handle_info(
        :state,
        state = %{board: board, player_1: player_1, player_2: player_2, turn: turn}
      ) do
    IO.puts("----------------------------------------")
    IO.puts("-------------Memory Game----------------")
    print_board(board)
    print_status(player_1.nick_name, player_1.score, player_1.lives)
    print_status(player_2.nick_name, player_2.score, player_2.lives)
    IO.puts("----------------------------------------")

    case turn == :player_1 do
      true -> IO.puts("Next turn: #{player_1.nick_name}")
      false -> IO.puts("Next turn: #{player_2.nick_name}")
    end

    {:noreply, state}
  end

  @impl true
  def terminate(reason, state) do
    print_error("--> #{reason}!")
    finish_game(state)
    IO.puts("\n")
  end
end

# alias AM3.MemoryServer
# MemoryServer.start_game()
# MemoryServer.next_turn()
