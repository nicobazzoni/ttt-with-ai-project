class Game 
    attr_accessor :board, :player_1, :player_2, :timer

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]


 def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end

  def board
    @board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each {|victory_num|
      move_1 = board.cells[victory_num[0]]
      move_2 = board.cells[victory_num[1]]
      move_3 = board.cells[victory_num[2]]

      return victory_num if ((move_1 == "X" && move_2 == "X" && move_3 == "X") ||
                          (move_1 == "O" && move_2 == "O" && move_3 == "O"))
    }
    return false
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    puts "\n~~~~~~~~"
    puts "Now it's player #{current_player.token}'s turn!\n"
    puts "Where you goin my guy? (1-9):\n"
    board.display

    agent_move = current_player.move(board)

    if board.valid_move?(agent_move)
      board.update(agent_move, current_player)
    else
      puts "That number is invalid."
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "\n"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "\n"
      puts "Cat's Game!"
    end
    board.display
  end

end
