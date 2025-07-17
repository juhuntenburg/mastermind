# frozen_string_literal: true

require_relative "../mastermind"

# Class to play the game the classic way, human cracking the code
class HumanMastermind < Mastermind
  attr_accessor :code

  def initialize
    @code = COLORS.values_at(*4.times.map { rand(6) })
    super(code)
  end

  def play
    (1..12).each do |i|
      puts "\nROUND #{i}"
      feedback = feedback(guess)
      puts "Correct position: #{feedback[:position]}"
      puts "Correct color: #{feedback[:color]}"
      return puts "You cracked the code!" if feedback[:position] == 4
    end
    puts "You ran out of trials, the correct code was: #{code.join}"
  end

  def guess
    loop do
      puts "Enter your guess, four characters of #{COLOR_NAMES}: "
      guess = gets.chomp.upcase.gsub(/[^RBGYOP]/, "").chars
      return guess if guess.size == 4

      print "Invalid guess. "
    end
  end
end

game = HumanMastermind.new
game.play
