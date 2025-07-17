# frozen_string_literal: true

# Base class for what is common to human and computer games
class Mastermind
  COLORS = %w[R B G Y O P].freeze
  COLOR_NAMES = "R(ed) B(lue) G(reen) Y(ellow) O(range) P(urple)"
  attr_accessor :code

  def initialize(code)
    @code = code
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
