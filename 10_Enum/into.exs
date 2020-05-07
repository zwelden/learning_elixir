IO.inspect Enum.map([1,2,3], fn x -> x * 2 end)
IO.inspect Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)

IO.inspect Enum.map(1..10, fn x -> x * 2 end)
IO.inspect Enum.reduce(1..10, 0, &+/2)

odd? = &(rem(&1, 2) != 0)
IO.inspect Enum.filter(1..10, odd?)

oddv2? = fn x -> rem(x, 2) !== 0 end
IO.inspect Enum.filter(1..10, oddv2?)

IO.puts 1..100_000
  |> Enum.map(&(&1 * 3))
  |> Enum.filter(odd?)
  |> Enum.sum

stream = Stream.cycle([1, 2, 3])
IO.inspect Enum.take(stream, 10)

stream2 = Stream.unfold("hełło", &String.next_codepoint/1)
IO.inspect Enum.take(stream2, 3)

file_stream = File.stream!('./stream_example.txt')
IO.inspect Enum.take(file_stream, 10)

