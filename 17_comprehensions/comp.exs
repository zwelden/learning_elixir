IO.puts "getting file sizes from directories"

dirs = ['/Users/zwelden/src/practice/noodling/', '/Users/zwelden/src/projects/ski_pass_mapper']

IO.inspect for dir <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path), do: File.stat!(path).size


IO.puts "\nbitstring generator"

pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>

IO.inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}


IO.puts "\nwhitespace removal"
IO.puts "no 'into:'"
IO.inspect for <<c <- " hello world ">>, c != ?\s, do: <<c>>
IO.puts "has 'into:'"
IO.puts for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>


IO.puts "\ntransform map values"
IO.puts "no 'into:'"
IO.inspect for {key, val} <- %{"a" => 1, "b" => 2, "c" => 3}, do: {key, val * val}
IO.puts "has 'into:'"
IO.inspect for {key, val} <- %{"a" => 1, "b" => 2, "c" => 3}, into: %{}, do: {key, val * val}
