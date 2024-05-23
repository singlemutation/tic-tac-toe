class Game
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    print_board(@board)
  end

  def print_board(board)
    puts " #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}"
    puts "----+-----+----"
    puts " #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}"
    puts "----+-----+----"
    puts " #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}"
  end

  def player_choice(num)
    @choice = 0
    until @choice.between?(1, 9)
      puts "Player #{num} choice:"
      @choice = gets.chomp.to_i
    end
  end

  def change_board(player, sym)
    player_choice(player)
    new_board = @board.map! do |row|
      row.map do |num|
        num == @choice ? sym : num
      end
    end
    print_board(new_board)
  end

  def play_game
    @game = nil
    until @game == 'won'
      change_board(1, 'X')
      game_won?('X')
      if @game == 'won'
        return @game == 'won'
      end
      change_board(2, 'O')
      game_won?('O')
    end
  end

  def game_won?(x)
    if @board[0] == [x, x, x] ||
       @board[1] == [x, x, x] ||
       @board[2] == [x, x, x] ||
       (@board[0][0] == x && @board[1][0] == x && @board[2][0] == x) ||
       (@board[0][1] == x && @board[1][1] == x && @board[2][1] == x) ||
       (@board[0][2] == x && @board[1][2] == x && @board[2][2] == x) ||
       (@board[0][0] == x && @board[1][1] == x && @board[2][2] == x) ||
       (@board[0][2] == x && @board[1][1] == x && @board[2][0] == x)
      puts "                 #{x} WINS!"
      @game = 'won'
    end
  end
end
game = Game.new
game.play_game

# winning combos
# [x][x][x]  # [x][ ][ ]  # [x][ ][ ]
# [ ][ ][ ]  # [x][ ][ ]  # [ ][x][ ]
# [ ][ ][ ]  # [x][ ][ ]  # [ ][ ][x]

# [ ][ ][ ]  # [ ][x][ ]  # [ ][ ][x]
# [x][x][x]  # [ ][x][ ]  # [ ][x][ ]
# [ ][ ][ ]  # [ ][x][ ]  # [x][ ][ ]

# [ ][ ][ ]  # [ ][ ][x]
# [ ][ ][ ]  # [ ][ ][x]
# [x][x][x]  # [ ][ ][x]
