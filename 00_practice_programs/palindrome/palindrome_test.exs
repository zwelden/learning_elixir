Code.require_file("./palindrome.exs")

ExUnit.start()

defmodule TestPalindrome do
  use ExUnit.Case, async: true
  require Palindrome

  test "palindrome returns true for word: \"racecar\"" do
    assert Palindrome.is_palindrome?("racecar") == true
  end

  test "palindrome returns false for a non palindrome word: \"palindrome\"" do
    assert Palindrome.is_palindrome?("palindrome") == false
  end

  test "palindrome returns true for calitalized word: \"Racecar\"" do
    assert Palindrome.is_palindrome?("Racecar") == true
  end

  test "palindrome returns false for unignored whitespace string: \"Top spot\"" do
    assert Palindrome.is_palindrome?("Top spot") == false
  end

  test "palindrome returns true for ignored whitespace string: \"Top spot\"" do
    assert Palindrome.is_palindrome?("Top spot", :yes) == true
  end

  test "palindrome returns true when special characters are used: \"Sé verla al revés\"" do
    assert Palindrome.is_palindrome?("Sé verla al revés", :yes) == true
  end

  test "palindrome returns true when chinese characters are used: \"风扇能扇风\"" do
    assert Palindrome.is_palindrome?("风扇能扇风") == true
  end
end
