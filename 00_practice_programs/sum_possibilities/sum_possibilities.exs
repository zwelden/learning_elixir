defmodule MathRoutes do
  @moduledoc """
    Using the numbers 1-9 generates a list of all possible combinations of those numbers
    that added or subtracted equals a given target

    ex: 1 + 2 + 3 - 4 + 5 + 6 + 78 + 9 = 100, where 100 is the target
  """

  @numbers ["1","2","3","4","5","6","7","8"]
  @modifiers ["", " + ", " - "]

  defp generate_num_mod_combinations do
    for m <- @modifiers do
      for x <- @numbers, do: x <> m
    end
  end

  defp generate_next_traversal_state(iteration) do
    iteration |> Integer.to_string(3)
      |> String.pad_leading(8, "0")
      |> String.graphemes()
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.into(%{}, fn {v, k} -> {k, String.to_integer(v)} end)
  end

  defp generate_math_string(state, num_mod_combos) do
    combo_list = for key <- 0..7 do
      Enum.fetch(num_mod_combos, Map.get(state, key))
        |> elem(1)
        |> Enum.fetch(key)
        |> elem(1)
    end

    Enum.join(combo_list, "") <> "9"
  end

  defp create_pattern(integer, num_mod_combos) do
    generate_next_traversal_state(integer) |> generate_math_string(num_mod_combos)
  end

  defp math_str_eq_target?(math_string, target) do
    {result, _} = Code.eval_string(math_string)

    result == target
  end

  def find_patterns(target) do
    num_mod_combos = generate_num_mod_combinations()

    Enum.to_list(0..6560)
      |> Enum.map(fn int -> create_pattern(int, num_mod_combos) end)
      |> Enum.filter(fn str -> math_str_eq_target?(str, target) end)
  end
end



IO.inspect MathRoutes.find_patterns(100)
