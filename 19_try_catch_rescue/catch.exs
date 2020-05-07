IO.puts "try / catch"
try do
  Enum.each -50..50, fn (x) ->
    if rem(x, 13) == 0, do: throw(x)
  end
  IO.puts "got nothing"
catch
  x -> IO.puts "Got #{x}"
end

IO.puts "\nEnum.find"
IO.puts Enum.find -50..50, &(rem(&1, 13) == 0)
IO.puts Enum.find -50..50, fn(x) -> (rem(x, 13) == 0) end
