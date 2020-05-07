defmodule FizzBuzz do
  def fizz_buzz_eval(n, fizz, buzz) do
    cond do
      rem(n, fizz) == 0 and rem(n, buzz) == 0 ->
        "fizzbuzz"
      rem(n, fizz) == 0 ->
        "fizz"
      rem(n, buzz) == 0 ->
        "buzz"
      true ->
        n
    end
  end

  def fizz_buzz(n, opts \\ %{fizz: 3, buzz: 5})
  def fizz_buzz(0, _), do: 0
  def fizz_buzz(n, opts) do
    fizz = opts.fizz
    buzz = opts.buzz

    IO.inspect for n <- 1..n, do: fizz_buzz_eval(n, fizz, buzz)
  end
end


defmodule FizzBuzz2 do
  def fizzbuzz(0,0,_), do: "FizzBuzz"
  def fizzbuzz(0,_,_), do: "Fizz"
  def fizzbuzz(_,0,_), do: "Buzz"
  def fizzbuzz(_,_,n), do: n

  def fizzbuzz_range(n, fizz \\ 3, buzz \\ 5) do
    IO.inspect for num <- 1..n, do: fizzbuzz(rem(num, fizz), rem(num, buzz), num)
  end
end


defmodule FizzBuzz3 do
  defguard is_divisible_by_x?(num, x) when rem(num, x) == 0

  def fizzbuzz(num, fizz, buzz) when is_divisible_by_x?(num, fizz * buzz), do: "FizzBuzz"
  def fizzbuzz(num, fizz, buzz) when is_divisible_by_x?(num, fizz), do: "Fizz"
  def fizzbuzz(num, fizz, buzz) when is_divisible_by_x?(num, buzz), do: "Buzz"
  def fizzbuzz(num, _, _), do: num

  def play(min, max, fizz \\ 3, buzz \\ 5) do
    IO.inspect for n <- min..max, do: fizzbuzz(n, fizz, buzz)
  end
end


FizzBuzz.fizz_buzz(50)
FizzBuzz2.fizzbuzz_range(50)
FizzBuzz3.play(1, 50)
