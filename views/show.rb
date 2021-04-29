require 'bundler'
Bundler.require

require_relative '../lib/board'

# a viewer to display a game board
class Show
  def initialize(boardstate)
    @b = boardstate
  end

  def display_board
    puts "
    ===========
    || #{@b[0].state} #{@b[3].state} #{@b[6].state} ||
    || #{@b[1].state} #{@b[4].state} #{@b[7].state} ||
    || #{@b[2].state} #{@b[5].state} #{@b[8].state} ||
    ===========
    "
  end

  def refresh
    system('clear')
    display_board
  end
end

#binding.pry
