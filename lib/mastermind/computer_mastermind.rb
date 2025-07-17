# frozen_string_literal: true

require_relative "base_mastermind"

class ComputerMastermind < BaseMastermind

  def play
    @code = enter_code
  end
end
