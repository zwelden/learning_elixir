defmodule ReverseList do
  def reverse([]), do: []
  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end

  def easy_way(list) do
    Enum.reverse(list)
  end
end

