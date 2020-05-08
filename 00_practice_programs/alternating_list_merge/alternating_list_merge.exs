defmodule AlternatingListMerge do
  def merge([], []), do: []
  def merge([], list), do: list
  def merge(list, []), do: list
  def merge([head | tail], [head2 | tail2]) do
    [head, head2] ++ merge(tail, tail2)
  end
end


IO.inspect AlternatingListMerge.merge([1,2,3,4], ["a", "b", "b"])
