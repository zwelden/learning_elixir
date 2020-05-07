defmodule Greeter do
  def get_name do
    name = String.trim(IO.gets "What is your name? ")
  end

  def greet_name(name) do
    name = String.capitalize(name)
    IO.puts("Howdy #{name}!")
  end

  def continue_greeting? do
    IO.puts "\n"

    continue? = String.downcase(
      String.trim(
        IO.gets("Would you like to greet another person? Y/n ")
      )
    )

    if continue? == "y" do
      greet_loop()
    end
  end

  def greet_loop do
    name = get_name()
    greet_name(name)

    continue_greeting?()
  end
end


Greeter.greet_loop()
