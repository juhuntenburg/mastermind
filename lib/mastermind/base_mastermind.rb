# frozen_string_literal: true

# Base class for what is common to human and computer games
class BaseMastermind
  COLORS = %w[R B G Y O P].freeze
  COLOR_NAMES = "R(ed) B(lue) G(reen) Y(ellow) O(range) P(urple)"

  def enter_code
    loop do
      puts "Enter your code, four characters of #{COLOR_NAMES}: "
      entered_code = gets.chomp.upcase.gsub(/[^RBGYOP]/, "").chars
      return entered_code if entered_code.size == 4

      print "Invalid code. "
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

  def feedback(code, guess)
    correct_pos = check_position(code, guess)
    correct_color = check_color(
      code.filter.with_index { |_, idx| !correct_pos[idx] },
      guess.filter.with_index { |_, idx| !correct_pos[idx] }
    )
    ("b" * correct_pos.count(true) + "w" * correct_color).ljust(4, "x")
  end
end
