class Game
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    print_board
  end

  def print_board
    p @board[0]
    p @board[1]
    p @board[2]
  end
end

game = Game.new
