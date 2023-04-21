defmodule ListSort do

  def sortList(list) do
    Enum.sort(list) |> IO.inspect(label: "Sorted list")
  end

  def reverseList(list) do
    Enum.reverse(list) |> IO.inspect(label: "Reversed list")
  end

  def start do
    list = ["Hello", "world!", "from", "elixir"]
    sortList(list)
    reverseList(list)
  end

end
