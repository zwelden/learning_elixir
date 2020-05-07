IO.puts 1 + 2
IO.puts 2 * 3
IO.puts 10 / 2
IO.puts div(10, 2)
IO.puts div(10, 3)
IO.puts rem(10, 3)
IO.puts 0o777
IO.puts 0x1F
IO.puts round(3.58)
IO.puts trunc(3.58)



add = fn a, b -> a + b end

IO.puts is_function(add)

IO.puts add.(2,3)


double = fn a -> add.(a, a) end

IO.puts double.(12)


l1 = [1, 2 , 3]
l2 = [4, 5, 6]
l3 = [1, true, 2, false, 3, true]
l4 = [true, false]

IO.inspect l1 ++ l2
IO.inspect l3 -- l4

IO.inspect hd(l1)
IO.inspect tl(l1)
