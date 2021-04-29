require 'bundler'
Bundler.require

require_relative './boardcase'
require_relative './players'

# a tictactoe game board
class Board

  attr_accessor :is_full, :is_win, :state, :winner

  def initialize
    @state = []
    fill_grid
    @is_full = full?
    @is_win = false
    win?
    @winner = nil
  end

  def fill_grid
    coords = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
    coords.each do |c|
      @state << BoardCase.new(c)
    end
  end

  def full?
    if @state.all?(&:is_full)
      true
    else
      false
    end
  end

  def win?
    win_col('A')
    win_col('B')
    win_col('C')
    win_line('1')
    win_line('2')
    win_line('3')
    win_diag
  end

  def win_col(letter)
    col = @state.dup.keep_if { |c| c.name.start_with?(letter) }
    if col.all? { |c| c.state == 'X' }
      @is_win = true
      @winner = col[0].state
    elsif col.all? { |c| c.state == 'O' }
      @is_win = true
      @winner = col[0].state
    end
  end

  def win_line(num_str)
    line = @state.dup.keep_if { |c| c.name.end_with?(num_str) }
    if line.all? { |c| c.state == 'X' }
      @is_win = true
      @winner = line[0].state
    elsif line.all? { |c| c.state == 'O' }
      @is_win = true
      @winner = line[0].state
    end
  end

  def win_diag
    diag1 = @state.dup.keep_if { |c| c.name == 'A1' || c.name == 'B2' || c.name == 'C3' }
    diag2 = @state.dup.keep_if { |c| c.name == 'A3' || c.name == 'B2' || c.name == 'C1' }
    if diag1.all? { |c| c.state == 'X' }
      @is_win = true
      @winner = diag1[0].state
    elsif diag2.all? { |c| c.state == 'X' }
      @is_win = true
      @winner = diag2[0].state
    elsif diag1.all? { |c| c.state == 'O' }
      @is_win = true
      @winner = diag1[0].state
    elsif diag2.all? { |c| c.state == 'O' }
      @is_win = true
      @winner = diag2[0].state
    end
  end

  def set_case(case_name, sign)
    to_change = @state.index { |c| c.name == case_name }
    @state[to_change].change_state(sign)
    @state[to_change].is_full = true
  end

end

#binding.pry
