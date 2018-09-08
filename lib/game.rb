class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                      [0,3,6], [1,4,7], [2,5,8],
                      [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
     @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if  @board.position(combo[0]+1) != " " && @board.position(combo[0]+1) == @board.position(combo[1]+1) && @board.position(combo[1]+1) == @board.position(combo[2]+1)
        return combo
      end
    end
  end

  def draw?
     @board.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
     self.won? ? @board.position(self.won?[0]+1) : nil
   end


  def turn
    puts "Where would you like to go? [1-9]"
    input = self.current_player.move(board).to_i
    @board.valid_move?(input) ? @board.update(input, current_player) : self.turn
    @board.display
    self.current_player
  end
  def play
    @board.display
    until self.over? do
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts ("Cat's Game!")
    end
    puts "Play again?[y/n]"
    input = gets.strip
    if input == "y"
      @board.reset!
      self.play
    else
      puts "Thanks for playing!"

    end

  end
end
