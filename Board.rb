class Board
  def initialize
    @grids = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end

  def print_board
    p @grids[0] + " | " + @grids[1] + " | " + @grids[2]
    p "------------"
    p @grids[3] + " | " + @grids[4] + " | " + @grids[5]
    p "------------"
    p @grids[6] + " | " + @grids[7] + " | " + @grids[8]
  end

  def replace_grid(move, sign)
    @grids.map! do |elt|
      if elt == move
        elt.replace(sign)
      else
        elt
      end
    end
    print_board
  end

  def game_over?(count, player)
    if count == 8
      p "It's a tie!"
      replay?
    else
      check_winning_patterns(player)
    end
  end

  def check_winning_patterns(player)
    if ( @grids[0] == @grids[1] && @grids[1] == @grids[2] ) ||
      ( @grids[3] == @grids[4] && @grids[4] == @grids[5] ) ||
      ( @grids[6] == @grids[7] && @grids[7] == @grids[8] ) ||
      ( @grids[0] == @grids[3] && @grids[3] == @grids[6] ) ||
      ( @grids[1] == @grids[4] && @grids[4] == @grids[7] ) ||
      ( @grids[2] == @grids[5] && @grids[5] == @grids[8] ) ||
      ( @grids[0] == @grids[4] && @grids[4] == @grids[8] ) ||
      ( @grids[2] == @grids[4] && @grids[4] == @grids[6] )
      p "Congrats! " + player.name + ". You win."
      replay?
    end
  end

  def replay?
    p "Play again? (y/n)"
    replay = gets.chomp
    if replay == "y"
      TicTacToe.new
    else
      abort("Thanks for playing")
    end
  end
end