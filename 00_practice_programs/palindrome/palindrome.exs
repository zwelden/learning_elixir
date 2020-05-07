defmodule Palindrome do
  def is_palindrome?(string, ignore_whitespace? \\ :no) do
    string = string |> String.trim |> String.downcase
    string = if (ignore_whitespace? == :yes),
                do: String.replace(string, " ", ""),
                else: string

    string_list = String.graphemes(string)
    reversed_string_list = Enum.reverse(string_list)

    if (string_list === reversed_string_list), do: true, else: false
  end
end
