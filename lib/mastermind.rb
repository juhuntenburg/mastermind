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
end

game = Game.new
game.create_code
guess = game.guess
puts guess
