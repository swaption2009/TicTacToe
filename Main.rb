require_relative "board"
require_relative "player"

class Main
  def initialize
    @board = Board.new
    @move_counts = 0
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
    p active_player.name + ", enter your move: (eg. B2) "
    move = gets.chomp
    @board.replace_grid(move, active_player.sign)
    @board.game_over?(@move_counts, active_player)
    @move_counts += 1
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

new_game = Main.new