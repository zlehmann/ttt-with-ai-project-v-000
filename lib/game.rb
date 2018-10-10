require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are there?"
    num_players = gets.strip
    puts "Who will as X's and go first?"
    token = gets.strip
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    turn = self.board.turn_count
    if turn.odd? == true
      return @player_2
    else
      return @player_1
    end
  end

  def won?
    result = nil
    WIN_COMBINATIONS.each do |win_combo|
      pos1 = self.board.position(win_combo[0]+1)
      pos2 = self.board.position(win_combo[1]+1)
      pos3 = self.board.position(win_combo[2]+1)
      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        result = win_combo
      elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
        result = win_combo
      end
    end
    if result == nil
      result = false
    end
    return result
  end

  def draw?
    if self.board.full? == false
      return false
    elsif self.won? != false
      return false
    else
      return true
    end
  end

  def over?
    if self.won? != false
      return true
    elsif self.draw? == true
      return true
    else
      return false
    end
  end

  def winner
    results = nil
    if self.won? != false
      results = self.board.position(self.won?[0]+1)
    end
    return results
  end

  include Players::Human
  def turn
    input = Players::Human.move(@board)
    if self.board.valid_move?(input) == false
      return "invalid"
    end
    return input
  end



end
