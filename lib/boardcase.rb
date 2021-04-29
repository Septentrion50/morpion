# a case in a tictactoe board
class BoardCase

  attr_accessor :name, :state, :is_full

  def initialize(name)
    @name = name
    @state = ' '
    @is_full = false
  end

  def change_state(new_state)
    case @is_full
    when false
      @state = new_state
    when true
      puts 'This case is already occupied!'
    end
  end
end
