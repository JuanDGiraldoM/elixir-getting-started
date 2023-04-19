defmodule S2.Games.Memory.MemoryUtils do
  def alphabet_map() do
    vowels = ["a", "e", "i", "o", "u"]
    alphabet = for letter <- String.graphemes("abcdefghijklmnopqrstuvwxyz") do
      case letter in vowels do
        true -> {String.to_atom(letter), {String.upcase(letter), letter, :vowel}}
        false -> {String.to_atom(letter), {String.upcase(letter), letter, :consonant}}
      end

    end

    Map.new(alphabet) #%{a: {"A", "a", :vowel}, b: {"B", "b", :consonant}, ...}
  end

  def get_vowels(alpha_map, l_vowels) when length(l_vowels) < 3 do
    keys_vowels = Enum.filter(alpha_map, fn {_k, v} -> elem(v, 2) == :vowel end) |> Enum.into(%{}) |> Map.keys
    v = Enum.random(keys_vowels)
    value = Map.get(alpha_map, v)
    l_vowels = unless Enum.member?(l_vowels, {elem(value, 0), elem(value, 1)}), do: [{elem(value, 0), elem(value, 1)} | l_vowels], else: l_vowels
    get_vowels(alpha_map,l_vowels)
  end
  def get_vowels(_, l_vowels), do: l_vowels


  def get_consonants(alpha_map, l_conson) when length(l_conson) < 3 do
    keys_conson = Enum.filter(alpha_map, fn {_k, v} -> elem(v, 2) == :consonant end) |> Enum.into(%{}) |> Map.keys
    c = Enum.random(keys_conson)
    value = Map.get(alpha_map, c)
    l_conson = unless Enum.member?(l_conson, {elem(value, 0), elem(value, 1)}), do: [{elem(value, 0), elem(value, 1)} | l_conson], else: l_conson
    get_consonants(alpha_map,l_conson)
  end
  def get_consonants(_, l_conson), do: l_conson

  def board() do
    """
    [ 1 ]  [ 2 ]  [ 3 ]  [ 4 ]
    [ 5 ]  [ 6 ]  [ 7 ]  [ 8 ]
    [ 9 ] [ 10 ] [ 11 ] [ 12 ]
    """
  end

  def load_board(sel_letters) do #[{"A", "a"}, {"B", "b"},....] end
    l_letters = Enum.flat_map(sel_letters, &Tuple.to_list/1) #["A", "a", "B", "b",....]
    l_pos = 1..12 |> Enum.to_list() |> Enum.shuffle() #[5, 3, 9, 1, ....]
    Enum.zip(l_letters, l_pos) #[{"A", 5}, {"a", 3}, ....]
  end



end