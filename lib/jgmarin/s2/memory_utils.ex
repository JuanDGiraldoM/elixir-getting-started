defmodule S2.MemoryUtils do
  @vowels ~w[a e i o u]
  @consonants ~w[b c d f g h j k l m n p q r s t v w x y z]

  def get_vowels(), do: Enum.shuffle(@vowels) |> Enum.slice(0..2)
  def get_consonants(), do: Enum.shuffle(@consonants) |> Enum.slice(0..2)
  def is_vowel?(letter), do: @vowels |> Enum.any?(fn vowel -> vowel == letter end)

  def print_status(nickname, score, lives) do
    IO.puts("\nPlayer: #{nickname}")
    IO.puts("Score: #{score}")
    IO.puts("Lives: #{lives}\n")
  end

  def load_board() do
    lower = get_vowels() ++ get_consonants()
    upper = lower |> Enum.map(&String.upcase/1)

    Enum.shuffle(lower ++ upper)
    |> Enum.map(fn letter -> %{letter: letter, hide: true} end)
    |> Enum.with_index()
  end

  def print_board(board) do
    IO.puts("\n")
    print_row(Enum.slice(board, 0..3))
    print_row(Enum.slice(board, 4..7))
    print_row(Enum.slice(board, 8..11))
    IO.puts("\n")
  end

  defp print_row(row), do: IO.puts(row |> Enum.map(&get_value/1) |> Enum.join("   "))

  defp get_value({%{letter: _letter, hide: hide}, index}) when hide == true,
    do: "[ #{index + 1} ]"

  defp get_value({%{letter: letter, hide: _hide}, _index}), do: "[ #{letter} ]"

  def is_board_ready?(board) do
    board
    |> Enum.filter(fn {%{hide: hide, letter: _}, _} -> hide == false end)
    |> Enum.count() == 12
  end

  def show_cells(board, first, second) do
    board
    |> Enum.map(fn {cell, i} = item ->
      if i == first || i == second, do: {show_cell(cell), i}, else: item
    end)
  end

  defp show_cell(map) when is_map(map), do: %{map | hide: false}

  def get_cell(board, index), do: board |> Enum.at(index)

  def get_letter(board, index),
    do: board |> get_cell(index) |> Tuple.to_list() |> List.first() |> Map.get(:letter)
end
