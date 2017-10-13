require 'pry'
class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, player_token)
    @board[index] = player_token
  end
  def position_taken?(index)
  #Check for an empty board is equal to " "
    if @board[index] == " "
      return false
    end
    if @board[index] == ""
      return false
    end
    if @board[index] == nil
      return false
    end
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
  end
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  def turn_count
    moves = 0
    # Checking each position on the board for an entry
    @board.each do |move|
      # If not empty increment moves by one
      if move == "X" || move == "O"
        moves += 1
      end
    end
    #return moves with or without 'return'
    moves
  end
  def current_player
    # if turn_count(board) % 2 == 0
    #   return "X"
    # else turn_count(board) % 2 != 0
    #   return "O"
    # end
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index)
      move(index, player_token)
      display_board
    else
      puts "Number taken please choose again."
      turn
    end
    move(index, player_token)
  end
end
