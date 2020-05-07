users = [
  john: %{name: "John", age: 27, langauges: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.puts "John's age before: "
IO.puts users[:john].age

users = put_in users[:john].age, 31

IO.puts "John's age after:"
IO.puts users[:john].age


IO.puts "Mary's languages before:"
IO.inspect(users[:mary].languages)

users = update_in users[:mary].languages, fn languages ->
  List.delete(languages, "Clojure")
end

IO.puts "Mary's languages after"
IO.inspect users[:mary].languages

