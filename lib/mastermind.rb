# frozen_string_literal: true

# Class to initiate and play the game
class Mastermind
  COLORS = %w[R B G Y O P].freeze
  COLOR_NAMES = "R(ed) B(lue) G(reen) Y(ellow) O(range) P(urple)"
  attr_accessor :code

  def initialize
    @code = COLORS.values_at(*4.times.map { rand(6) })
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

  def check_position(code, guess)
    guess.each_with_index.map { |val, idx| code[idx] == val }
  end

  def check_color(code, guess)
    guess.reduce(0) do |count, val|
      (count += 1 and code.delete_at(code.index(val))) if code.any?(val)
      count
    end
  end

  def feedback(guess)
    correct_pos = check_position(code, guess)
    correct_color = check_color(
      code.filter.with_index { |_, idx| !correct_pos[idx] },
      guess.filter.with_index { |_, idx| !correct_pos[idx] }
    )
    { position: correct_pos.count(true), color: correct_color }
  end
end

game = Mastermind.new
game.play
