defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end


IO.puts Math.sum_list([1,2,3,4,5], 0)
IO.inspect Math.double_each([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
