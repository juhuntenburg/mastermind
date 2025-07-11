# Four positions: 1, 2, 3, 4
# Six colors: R(ed), B(lue), G(reen), Y(ellow), O(range), P(urple)

# Game class
# For 12 rounds or until code cracked:
## Compare guess with code
## Return feedback: right color wrong position / right color right position
class Game
  attr_accessor :colors, :color_names, :code

  def initialize
    @colors = %w[R B G Y O P]
    @color_names = "R(ed) B(lue) G(reen) Y(ellow) O(range) P(urple)"
  end

  def create_code
    @code = colors.values_at(*4.times.map {rand(6)})
  end

  def guess
    loop do
      puts "Enter your guess, four characters of #{color_names}: "
      guess = gets.chomp.upcase.gsub(/[^RBGYOP]/, "").split("")
      return guess if guess.size == 4
      print "Invalid guess. "
    end
  end

  def check_position(code, guess)
    guess.each_with_index.map {|val, idx| code[idx] == val}
  end

  def check_color(code, guess)
    guess.reduce(0) do |count, val|
      (count += 1 ; code.delete_at(code.index(val))) if code.any?(val)
      count
    end
  end

  def feedback(guess)
    correct_pos = check_position(code, guess)
    correct_color = check_color(
      code.filter.with_index { |_, idx| !correct_pos[idx] },
      guess.filter.with_index { |_, idx| !correct_pos[idx] }
    )
    {position: correct_pos.count(true), color: correct_color}
    end
end

game = Game.new
game.create_code
p game.code
guess = game.guess
p game.feedback(guess)
