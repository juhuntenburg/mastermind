# frozen_string_literal: true

require_relative "base_mastermind"

# Class to play the game the classic way, human cracking the code
class HumanMastermind < BaseMastermind
  attr_accessor :code

  def initialize(debug: false)
    @code = COLORS.values_at(*4.times.map { rand(6) })
    print code if debug
    super()
  end

  def play
    (1..12).each do |i|
      puts "\nROUND #{i}"
      feedback = feedback(enter_code)
      puts "Correct position: #{feedback.count('b')}"
      puts "Correct color: #{feedback.count('w')}"
      return puts "You cracked the code!" if feedback.count("b") == 4
    end
    puts "You ran out of trials, the correct code was: #{code.join}"
  end
end
