# frozen_string_literal: true

require_relative "mastermind/human_mastermind"
require_relative "mastermind/computer_mastermind"


game = HumanMastermind.new(debug: true)
game.play


game = ComputerMastermind.new
game.play
