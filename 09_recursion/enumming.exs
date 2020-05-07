IO.inspect Enum.reduce([1,2,3], 0, fn(x, acc) -> x + acc end)
IO.inspect Enum.map([1,2,3], fn(x) -> x * 2 end)

IO.inspect Enum.reduce([1,2,3], 0, &+/2)
IO.inspect Enum.map([1,2,3], &(&1 * 2))
