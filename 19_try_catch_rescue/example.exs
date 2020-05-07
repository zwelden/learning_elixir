defmodule MyError do
  defexception message: "default message"
end


try do
  raise MyError
rescue
  e in MyError -> IO.puts e.message
end

try do
  raise MyError, message: "custom message"
rescue
  e in MyError -> IO.puts e.message
end
