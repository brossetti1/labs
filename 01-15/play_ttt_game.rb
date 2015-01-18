require './tic-tac-toe_classes.rb'
require './gameart'

player1 = Player.new()
player1.get_name
configuration = player1.choose_mode
computer_config_one = configuration[0..1]
computer_config_two = configuration.rotate[1,2].rotate 
if configuration[0] == 1
  player2 = Player.new()
  player2.get_name
elsif configuration[0] == 2
  player2 = Computer.new(computer_config_one)
else
  player1 = Computer.new(computer_config_one)
  player2 = Computer.new(computer_config_two)
end

game = Game.new(player1, player2)
game.play_game
