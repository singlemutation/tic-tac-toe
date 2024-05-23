# frozen_string_literal: true

# Start a game by creating 2 players and a board
class Game
  def initialize
    @player1 = Player.new(1, 'x')
    @player2 = Player.new(2, 'o')
    puts "\n"
    puts '-----------'
    puts "Let's play!"
    puts '-----------'
    puts "\n"
    make_board
    print_board(@board)
    # round
  end

  def make_board
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def print_board(board)
    p board[0]
    p board[1]
    p board[2]
  end

  def change_board(player, sym)
    choice(player)
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
      change_board(@player1, 'x')
      game_won?('x')
      change_board(@player2, 'o')
      game_won?('o')
    end
  end

  def choice(player)
    @choice = player.player_choice
  end

  # def round
  #   2.times do
  #     choice(@player1)
  #     print_board
  #     choice(@player2)
  #     print_board
  # end
  # end
  def game_won?(x)
    if @board[0] == [x, x, x] ||
       @board[1] == [x, x, x] ||
       @board[2] == [x, x, x] ||
       (@board[0][0] == x && @board[1][0] == x && @board[2][0] == x) ||
       (@board[0][1] == x && @board[1][1] == x && @board[2][1] == x) ||
       (@board[0][2] == x && @board[1][2] == x && @board[2][2] == x) ||
       (@board[0][0] == x && @board[1][1] == x && @board[2][2] == x) ||
       (@board[0][2] == x && @board[1][1] == x && @board[2][0] == x)
      puts "#{x} wins"
      @game = 'won'
    end
  end
end

# Create players
class Player
  def initialize(num, sym)
    @num = num
    @sym = sym
    puts "Hello, player #{@num}, what is your name?"
    @name = gets.chomp
    puts "Hello, #{@name}, you will be #{@sym}!"
  end

  def player_choice
    @choice = 0
    until @choice.between?(1, 9)
      puts "#{@name}'s choice:"
      @choice = gets.chomp.to_i
    end
  end
end

game = Game.new
game.play_game
