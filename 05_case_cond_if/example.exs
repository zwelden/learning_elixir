case {1,2,3} do
  {4,5,6} ->
    IO.puts "This will never match"
  {1, x, 3} ->
    IO.puts "This will match and bind 2 to x"
  _ ->
    IO.puts "This clause will match any value"
end


x = 1

case 10 do
  ^x ->
    IO.puts "This clause will not match"
  _ ->
    IO.puts "But this one will"
end


case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    IO.puts "This will match"
  _ ->
    IO.puts "Would match if gaurd were not met"
end


case 10 do
  x when hd(x) ->
    IO.puts "guard failed"
  x ->
    IO.puts "failed guard ignored, x = #{x}"
end


f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end


IO.puts f.(1,2)
IO.puts f.(-2,4)


cond do
  2 + 2 == 5 ->
    IO.puts "This is never true"
  2 + 2 == 3 ->
    IO.puts "neither is this"
  2 + 2 == 4 ->
    IO.puts "But this works"
end

cond do
  2 + 2 == 5 ->
    IO.puts "nope"
  2 + 2 == 3 ->
    IO.puts "also nope"
  true ->
    IO.puts "will always match if no other coniditions are met"
end

cond do
  hd([5,6,7]) ->
    IO.puts "5 is considered as true, non nil/false values will always activate the condition"
end



if true do
  IO.puts "It must be true"
end


unless true do
  IO.puts "never to be seen again"
end


if false do
  IO.puts "abc123"
else
  IO.puts "print me instead"
end
