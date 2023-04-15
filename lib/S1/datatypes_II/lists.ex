defmodule S1.DatatypesII.Lists do
  defp concept do
    """
    Lists in Elixir are implemented as linked lists, not as arrays of contiguous memory locations.
    Therefore, accessing an element of a list takes a linear time that depends on the length of the list.

    """
  end

  def head_and_tail do
    numbs = [22, 1, 2]
    [head | tail] = numbs

    IO.puts("Head 1: #{head}")
    IO.inspect(tail, label: "Tail 1")

    IO.puts("Head 2: #{hd(numbs)}")
    IO.inspect(tl(numbs), label: "Tail 2")

  end

  def for_loop do
    nums_example = [3, 10, 7, 2, 1 ,6]

    for x <- nums_example, do: IO.puts("#{x} is even: #{rem(x, 2) == 0}")

    for x <- nums_example do
      IO.puts("#{x} is even: #{rem(x, 2) == 0}")
    end
  end

  def add_remove_elems do
    """
    Adding an element requires traversing the entire list and adding the element at the end,
    so adding a new element at each iteration would require traversing the entire list at each
    iteration.We can achieve the same result by prepending an element to the inverted list,
    and then inverting the result. Pre-allocation is a fast operation and requires constant time.
    """
    nums_example = [3, 10, 7, 2, 1 ,6]


    IO.inspect(nums_example ++ [ :new ], label: "Add element with ++")
    IO.inspect([ :new | nums_example], label: "Add element with | #1")
    IO.inspect([nums_example | :new ], label: "Add element with | #2")
  end

  def some_functions do
    IO.inspect(List.first(nums_example), label: "First element")
    IO.inspect(List.last(nums_example), label: "Last element")
    IO.inspect(List.insert_at(nums_example, 0, :new_insert), label: "New insert")
    IO.inspect(List.replace_at(nums_example, 0, :replaced), label: "Replaced")
  end


end












