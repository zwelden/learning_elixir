defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum 3, 4



defmodule Math2 do
  # publicly avaliable method
  def sum(a, b) do
    do_sum(a, b)
  end

  # private method only avaliable inside module
  defp do_sum(a, b) do
    a + b
  end

  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

IO.puts Math2.sum(4, 5)
# IO.puts Math2.do_sum(4, 5)

IO.puts Math2.zero?(0)
IO.puts Math2.zero?(5)
# IO.puts Math2.zero?([1,2,3])



defmodule Math3 do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end

IO.puts Math3.zero?(0)
IO.puts Math3.zero?(5)
# IO.puts Math3.zero?([1,2,3])



defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts Concat.join("some", "word")
IO.puts Concat.join("some", "word2", "-")



defmodule DefaultTest do
  def dowork(x \\"hello") do
    x
  end
end

IO.puts DefaultTest.dowork()
IO.puts DefaultTest.dowork("yolo")



defmodule Concat2 do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concat2.join("one")
IO.puts Concat2.join("one", "two")
IO.puts Concat2.join("one", "two", "~")
