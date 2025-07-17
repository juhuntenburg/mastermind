# frozen_string_literal: true

require_relative "base_mastermind"

# Version where the human creates the code and the computer guesses
class ComputerMastermind < BaseMastermind

  def play
    @code = enter_code
    (1..12).each do |i|
      sleep(2)
      puts "\nROUND #{i}"
      guess = COLORS.values_at(*4.times.map { rand(6) })
      puts "Computer guesses #{guess.join}"
      feedback = feedback(guess)
      puts "Correct position: #{feedback[:position]}"
      puts "Correct color: #{feedback[:color]}"
      return puts "Computer cracked the code!" if feedback[:position] == 4
    end
    puts "Computer ran out of trials, the correct code was: #{code.join}"
  end
end
