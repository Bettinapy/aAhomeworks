class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @seq = []
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "Here's the sequence:"
    puts @seq.join(" ")
  end

  def require_sequence
    puts "repeat back the new sequence e.g. 'red blue yellow green'"
    seq_arr = gets.chomp.split
    if seq_arr != @seq
      @game_over = true
    end
  end

  def add_random_color
    num = 0
    while num < @sequence_length
      @seq << COLORS.sample
      num += 1
    end
  end

  def round_success_message
    puts "--------Sucess!--------"
  end

  def game_over_message
    puts "--------GAME OVER--------"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

s = Simon.new
s.play