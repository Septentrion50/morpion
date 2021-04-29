require 'bundler'
Bundler.require

require_relative './game'

# game manager
class Application

  def initialize
    @first_name1 = ask_name(1)
    @first_name2 = ask_name(2)
    @game = Game.new(@first_name1, @first_name2)
    play
  end

  def ask_name(player_num)
    puts "What's your name, player #{player_num}?"
    gets.chomp
  end

  def play
    while !@game.current_game.is_win
      @game.set_turn
      @game.grid
      if @game.current_game.full?
        break
      else
        puts "Your turn #{@game.turn.name}"
        @game.ask_move
        @game.current_game.win?
        @game.counter += 1
      end
    end
    @game.get_winner
    if !@game.winner
      @game.grid
      puts "It's a tie!"
    else
      @game.grid
      puts "#{@game.winner} won!"
    end
    puts 'replay ? Y/N'
    replay
  end

  def replay
    ans = gets.chomp
    if ans == "Y".downcase
      @game = Game.new(@first_name1, @first_name2)
      play
    elsif ans == "N".downcase
      puts 'Bye!'
    end
  end
end
