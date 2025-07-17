# frozen_string_literal: true

require_relative "base_mastermind"

class ComputerMastermind < BaseMastermind

  def initialize(debug: false)
    @code = enter_code
    super(code, debug: debug)
  end
end
