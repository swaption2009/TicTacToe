class Games
  def initialize
    @board = Board.new
    enter_players
  end

  def enter_players
    p "Enter player 1's name: "
    name = gets.chomp
    @player1 = Player.new(name, true, "X")
    p "Enter player 2's name: "
    name = gets.chomp
    @player2 = Player.new(name, false, "O")
    p @player1.name + " is playing 'X' and " + @player2.name + " is playing 'O' "
    print_board
  end

  def print_board
    @board.print_board
    enter_player_move
  end

  def enter_player_move
    p active_player.name + "enter your move: (eg. B2) "
    move = gets.chomp
    @board.replace_grid(move, active_player.sign)
    switch_active_player
  end

  def active_player
    if @player1.active
      @player1
    else
      @player2
    end
  end

  def switch_active_player
    @player1.active = !@player1.active
    @player2.active = !@player2.active
    enter_player_move
  end
end

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
end

class Player
  attr_accessor :name, :active, :sign

  def initialize(name, active, sign)
    @name = name
    @active = active
    @sign = sign
  end
end

new_game = Games.new
