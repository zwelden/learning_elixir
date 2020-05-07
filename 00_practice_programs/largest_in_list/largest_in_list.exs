defmodule LargestInList do
  def find_largest(list, current_max \\ nil)

  def find_largest([], current_max) do
    current_max
  end

  def find_largest([head | tail], current_max) do
    current_max = if (is_nil(current_max)), do: head, else: current_max
    current_max = if (head > current_max), do: head, else: current_max

    find_largest(tail, current_max)
  end


  def easy_way(list) do
    Enum.max(list)
  end
end


# list = [1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1]

# IO.puts LargestInList.find_largest(list)
# IO.puts LargestInList.easy_way(list)

