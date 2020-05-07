defmodule SumOrProduct do
  def get_number do
    IO.gets("Enter a number to sum/product to: ")
      |> String.trim
      |> String.to_integer
  end

  def get_calculation_type do
    calc_type = IO.gets("Perform sum or product? S/p ")
      |> String.trim
      |> String.downcase
      |> String.slice(0..1)

    case calc_type do
      "s" ->
        :sum
      "p" ->
        :product
    end
  end

  def perform_calculation(num, type) do
    func = if type == :product, do: &*/2, else: &+/2

    Enum.reduce(2..num, 1, func)
  end

  def continue? do
    cont? = IO.gets("Would you like to perform another calculation? Y/n ")
     |> String.trim
     |> String.downcase
     |> String.slice(0..1)

    if (cont? == "y"), do: :yes, else: :no
  end

  def init do
    num = get_number()
    type = get_calculation_type()

    perform_calculation(num, type) |> IO.puts

    cont? = continue?()

    if (cont? == :yes), do: init()
  end
end


SumOrProduct.init()
