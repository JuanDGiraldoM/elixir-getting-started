_enums = """
In Elixir, an enumerable is any data type that implements the Enumerable protocol.
It acts as soon as its functions are invoked, having an 'eager' behavior.
"""

nums_ex = [2,5,8,9,1,2,3,0,3,4]
IO.inspect(nums_ex, label: 'The list')
IO.inspect(Enum.sum(nums_ex), label: 'Sum of all elements')
IO.inspect(Enum.product(nums_ex), label: 'Product of all elements')
IO.inspect(Enum.at(nums_ex, 0), label: 'First element' )
IO.inspect(Enum.at(nums_ex, -1), label: 'Last element' )
IO.inspect(Enum.concat(nums_ex, [0, 1, 0]), label: 'Concatenation with #{inspect([0, 1, 0])}')
IO.inspect(Enum.count(nums_ex), label: 'Total of elements')
IO.inspect(Enum.take(nums_ex, 3), label: 'Take the first 3 elements')
IO.inspect(Enum.drop(nums_ex, 3), label: 'Drop the first 3 elements')
IO.inspect(Enum.empty?(nums_ex), label: 'Is the list empty?')
IO.inspect(Enum.fetch(nums_ex, 0), label: 'Catch first element')
IO.inspect(Enum.fetch(nums_ex, 10), label: 'Catch 10th element')
IO.inspect(Enum.join(nums_ex), label: 'Joining elements')
IO.inspect(Enum.join(nums_ex, "; "), label: 'Join elements by ;')
IO.inspect(Enum.max(nums_ex), label: 'Greatest number')
IO.inspect(Enum.min(nums_ex), label: 'Smallest number')
IO.inspect(Enum.random(nums_ex), label: 'A random number')
IO.inspect(Enum.reverse(nums_ex), label: 'Inverted list')
IO.inspect(Enum.sort(nums_ex), label: 'Sorted list')
IO.inspect(Enum.uniq(nums_ex), label: 'List with unique elements')


