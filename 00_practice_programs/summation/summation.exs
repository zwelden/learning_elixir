defmodule Summation do
  def get_max_number do
    IO.gets("Enter the max number to sum to: ")
      |> String.trim
      |> String.to_integer
  end

  def sum_1_to_n(0), do: 0
  def sum_1_to_n(n), do: n + sum_1_to_n(n - 1)

  def sum_1_to_n_skipping(0), do: 0
  def sum_1_to_n_skipping(n) do
    if (rem(n, 5) == 0 or rem(n, 3) == 0) do
      n + sum_1_to_n_skipping(n - 1)
    else
      sum_1_to_n_skipping(n - 1)
    end
  end

  def print_summation(n, mode \\ :noskip) do
    fn_sum = if (mode == :noskip), do: &sum_1_to_n/1, else: &sum_1_to_n_skipping/1
    IO.puts fn_sum.(n)
  end

  def continue?(mode \\ :noskip) do
    cont? = IO.gets("Sum new range? Y/n ")
      |> String.trim
      |> String.downcase

    if cont? == "y" do
      if (mode == :noskip), do: summation_loop(), else: summation_skipping_loop()
    end
  end

  def summation_loop do
    n = get_max_number()
    print_summation(n)
    continue?()
  end

  def summation_skipping_loop do
    n = get_max_number()
    print_summation(n, :skip)
    continue?(:skip)
  end
end

# Summation.summation_loop()
Summation.summation_skipping_loop()
