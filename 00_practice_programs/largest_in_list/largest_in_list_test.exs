Code.require_file("./largest_in_list.exs")

ExUnit.start()

defmodule AssertionTest do
  use ExUnit.Case, async: true
  require LargestInList

  test "find_largest detects largest number in ordered list" do
    list = Enum.to_list(1..100)
    assert LargestInList.find_largest(list) == 100
  end

  test "find_largest detects largest number in unordered list" do
    list = Enum.to_list(1..100) ++ Enum.to_list(99..1)
    assert LargestInList.find_largest(list) == 100
  end

  test "find_largest detects largest number in ordered list of negative numbers" do
    list = Enum.to_list(-10..-100)
    assert LargestInList.find_largest(list) == -10
  end

  test "find_largest detects largest number in unordered list of negative numbers" do
    list = Enum.to_list(-100..-11) ++ Enum.to_list(-10..-100)
    assert LargestInList.find_largest(list) == -10
  end
end
