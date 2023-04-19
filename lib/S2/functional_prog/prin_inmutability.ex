defmodule S2.FunctionalProg.Inmutability do
  def inmutability_0 do
    _ = """
    When you rebind a variable in Elixir, the previous value that the variable referred to becomes inaccessible and may be garbage collected,
    depending on whether or not there are any other references to it.

    In the example you gave, after you rebind a from 1 to 2, the value 1 is no longer directly accessible through a. However,
    if there are other variables or data structures that hold a reference to the value 1, then it will continue to exist in memory
    until those references are no longer held. If there are no other references to the value 1, it may be garbage collected by the Elixir runtime system.

    The Elixir runtime system has a garbage collector that automatically reclaims memory that is no longer in use.
    The garbage collector is triggered periodically by the system and scans the heap to identify objects that are no longer in use.
    These objects are then reclaimed and the memory they were using is returned to the system.

    The exact timing of the garbage collection process depends on various factors, such as the amount of available memory and the number
    of objects that have been created. In general, the garbage collector runs frequently enough to keep memory usage under control,
    but not so frequently that it causes significant overhead.
    """

    a = 1
    IO.inspect(a, label: "a first value")

    b = a
    IO.inspect(b, label: "b first value")

    a = 2
    IO.inspect(a, label: "a re-binding another value")
    IO.inspect(b, label: "b keeps first value of a")

  end

  def inmutability_1 do
    list = [1, 2, 3]

    # Attempt to modify the first element
    #list[0] = 4

    # This will raise an error because the list is immutable
    # Instead, a new list must be created with the updated value
    new_list = [4 | tl(list)]

    # The original list remains unchanged
    IO.inspect list  # Output: [1, 2, 3]

    # The new list contains the updated value
    IO.inspect new_list  # Output: [4, 2, 3]

  end

end