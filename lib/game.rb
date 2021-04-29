require 'bundler'
Bundler.require

require_relative './players'
require_relative './board'
require_relative '../views/show'

# a tictactoe game
class Game

  attr_accessor :turn, :winner, :show_grid, :current_game, :counter

  def initialize(player1, player2)
    @player1 = Player.new(player1, 'X')
    @player2 = Player.new(player2, 'O')
    @counter = 0
    @turn = set_turn
    @current_game = Board.new
    @show_grid = Show.new(@current_game.state)
    @winner = @current_game.winner
  end

  def set_turn
    if @counter.even?
      @turn = @player1
    else
      @turn = @player2
    end
  end

  def ask_move
    puts "What's your next move ?"
    move = gets.chomp.upcase
    @current_game.set_case(move, @turn.sign)
  end

  def grid
    @show_grid.refresh
  end

  def get_winner
    if @current_game.winner == @player1.sign
      @winner = @player1.name
    elsif @current_game.winner == @player2.sign
      @winner = @player2.name
    end
  end
end

#binding.pry
