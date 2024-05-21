class Board
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

class Game
  def initialize
    @player1 = Player1.new
    @player2 = Player2.new
    puts "\n"
    puts '-----------'
    puts "Let's play!"
    puts '-----------'
    puts "\n"
    @board = Board.new
  end
end

class Player1
  def initialize
    puts 'Hello, player 1, what is your name?'
    @name = gets.chomp
    puts "Hello, #{@name}! You're x!"
  end
end

class Player2
  def initialize
    puts 'Hello, player 2, what is your name?'
    @name = gets.chomp
    puts "Hello, #{@name}! You're o!"
  end
end

Game.new
