# frozen_string_literal: true

require_relative "base_mastermind"

# Version where the human creates the code and the computer guesses
class ComputerMastermind < BaseMastermind
  attr_accessor :actual_code, :remaining, :plausible, :results

  def initialize
    @actual_code = enter_code
    @remaining = COLORS.repeated_permutation(4).to_a
    @plausible = COLORS.repeated_permutation(4).to_a
    @results = %w[b w x].repeated_combination(4).to_a
    super
  end

  def play
    guess = %w[R R B B]
    (1..12).each do |round|
      puts "\nROUND #{round}: Computer guesses #{guess.join}"
      result = feedback(actual_code, guess)
      return puts "Computer cracked the code!" if result.count("b") == 4

      guess = next_guess(guess, result)
    end
    puts "Computer ran out of trials, the correct code was: #{code.join}"
  end

  def next_guess(guess, result)
    remaining.delete(guess)
    self.plausible = plausible.select { |p| feedback(guess, p) == result }
    scores = minimax(remaining, plausible)
  end

  def minimax(remaining, plausible)
    scores = {}
    remaining.each do |guess|
      comb_score = results.map do |result|
        plausible.select { |p| feedback(guess, p) == result.join }.size
      end
      scores[guess.join] = comb_score.min
    end
    scores
  end

end
