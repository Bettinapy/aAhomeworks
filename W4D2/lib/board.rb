class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = self.place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14){Array.new(4){:stone}}
    cups[6] = []
    cups[13] = []
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos >= @cups.length
    raise "Starting cup is empty" if @cups[start_pos].length == 0 
  end

  def make_move(start_pos, current_player_name)
    @current_player_name = current_player_name
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    next_pos = (start_pos + 1) % 14
    while stones > 0
      if current_player_name == @name1
        if next_pos != 13
          @cups[next_pos] << :stone
          next_pos = (next_pos + 1) % 14
          stones -= 1
        else
          next_pos = (next_pos + 1) % 14
        end
      else
        if next_pos != 6
          @cups[next_pos] << :stone
          next_pos = (next_pos + 1) % 14
          stones -= 1
        else
          next_pos = (next_pos + 1) % 14
        end
      end
    end
    self.render
    next_turn(next_pos)

  end
  require "byebug"
  def next_turn(ending_cup_idx)
    ending_pos = ending_cup_idx % 14
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @current_player_name == @name1
      if ending_pos == 6
        return :prompt
      end
    end
    if @current_player_name == @name2
      if ending_pos == 13
        return :prompt
      end
    end
    if @cups[ending_pos].length == 0
      return :switch
    else  
      ending_pos
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? {|i| @cups[i].length == 0} || (7..12).all? {|i| @cups[i].length == 0}
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1
    else 
      return @name2
    end
  end
end
