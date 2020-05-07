Code.require_file("./reverse_list.exs")

ExUnit.start()

defmodule AssertionTest do
  use ExUnit.Case, async: true
  require ReverseList

  test "reverse ordered numerical list" do
    list = [1,2,3,4,5,6,7,8,9]
    assert ReverseList.reverse(list) == [9,8,7,6,5,4,3,2,1]
  end

  test "reverse unordered numerical list" do
    list = [3,5,2,1,4,9,8,6,7]
    assert ReverseList.reverse(list) == [7,6,8,9,4,1,2,5,3]
  end

  test "reverse mixed type list" do
    list = ["a", :some_atom, 5, 'charlist', 789, "a wordy string"]
    assert ReverseList.reverse(list) == ["a wordy string", 789, 'charlist', 5, :some_atom, "a"]
  end

  test "custom solution equal kernal solution" do
    list = [1,2,3,4,5,6,7,8,9,"a", "b", "c", "d", :one, :two, :three, 'char', 'morechar', 'somechar']
    assert ReverseList.reverse(list) == ReverseList.easy_way(list)
  end
end
