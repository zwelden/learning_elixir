defmodule GuessingGame do
  def get_upper_bound do
    IO.puts "\n"
    IO.gets("[?][?] What is the max number for the game? ")
      |> String.trim
      |> String.to_integer
  end


  def generate_random_target_number(max) do
    Enum.random(1..max)
  end


  def get_next_guess(game_state) do
    IO.puts "\n"
    guess = IO.gets("[?][?] Guess: ")
     |> String.trim
     |> String.to_integer

     Map.put(game_state, :guess_before_last, game_state.last_guess)
      |> Map.put(:last_guess, guess)
  end


  def evaluate_guess(game_state) do
    target = game_state.target
    guess = game_state.last_guess

    status = cond do
      target == guess ->
        :win
      target > guess ->
        :low
      target < guess ->
        :high
    end

    Map.put(game_state, :status, status)
  end


  def increment_guesses(game_state) do
    last_guess = game_state.last_guess
    guess_before_last = game_state.guess_before_last

    guesses = if (last_guess != guess_before_last),
                  do: game_state.num_guesses + 1,
                  else: game_state.num_guesses

    Map.put(game_state, :num_guesses, guesses)
  end


  def game_over?(game_state) do
    num_guesses = game_state.num_guesses
    status = game_state.status

    cond do
      status == :win ->
        win_condition(game_state)
      num_guesses >= 20 ->
        lose_condition(game_state)
      true ->
        guess_loop(game_state)
    end
  end


  def win_condition(game_state) do
    num_guesses = game_state.num_guesses
    target = game_state.target
    IO.puts "\n"
    IO.puts "************************************"
    IO.puts "You've WON!\nTarget number: #{target}\nNumber of guesses: #{num_guesses}"
    IO.puts "************************************"
  end


  def lose_condition(game_state) do
    target = game_state.target

    IO.puts "\n"
    IO.puts "************************************"
    IO.puts "Max guesses reached, you LOOSE!\nCorrect number was: #{target}"
    IO.puts "************************************"
  end


  def print_start_screen do
    IO.puts "\n\n\n"
    IO.puts "************************************"
    IO.puts "Welcome to the \"Guessing Game\""
    IO.puts "Choose the maximum number the random target number can be in"
    IO.puts "Then attempt to guess the target number in 20 guesses or less"
    IO.puts "************************************"
  end


  def print_game_state(game_state) do
    last_guess = game_state.last_guess
    num_guesses = game_state.num_guesses
    status = game_state.status

    IO.puts "\n"
    IO.puts "***********************************"
    IO.puts " Number of Guesses: #{num_guesses}"
    IO.puts " Last Guess: #{last_guess}"
    IO.puts " Last guess was #{status}"
    IO.puts "***********************************"
  end


  def guess_loop(game_state) do
    print_game_state(game_state)

    get_next_guess(game_state)
      |> evaluate_guess
      |> increment_guesses
      |> game_over?
  end


  def continue? do
    IO.puts "\n"
    cont? = IO.gets("[?][?] Would you like to play again? Y/n ")
     |> String.trim
     |> String.downcase
     |> String.slice(0..1)

    if (cont? == "y"), do: :yes, else: :no
  end


  def play do
    print_start_screen()

    max = get_upper_bound()
    target = generate_random_target_number(max)

    guess_loop(%{max: max, target: target, last_guess: nil, guess_before_last: nil, num_guesses: 0, status: nil})

    if continue?() == :yes, do: play()
  end
end


GuessingGame.play()
