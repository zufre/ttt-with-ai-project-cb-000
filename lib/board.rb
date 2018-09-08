class Board
  attr_accessor :cells


  def reset!
    cells.clear
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
    @cells[(input.to_i - 1)]
  end
  def full?
    @cells.none? do |cell|
      cell == " "
    end
  end
  def turn_count
    count = 0
    @cells.each do |cell|
      if cell != " "
        count +=1
      end
    end
    count
  end
  def taken?(input)
    @cells[input.to_i-1] != " "
  end
  def valid_move?(input)
    !self.taken?(input) && input.to_i.between?(1, 9)
  end
  def update(input, player)
    @cells[input.to_i-1] = player.token
    @cells
  end



end
