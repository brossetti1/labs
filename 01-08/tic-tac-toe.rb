require 'pry'
#require_relative 'game_art'

######
#
#
#  Tick-Tac-Toe Day 4 for IronYard Spring Jan 08, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#
#  * Running `ruby tic-tac-toe.rb` should play a game of tic-tac-toe in the terminal.
#  
#  ## Easy Mode
#  
#  The script should play a game of tic-tac-toe to completion and print the game's outcome. Each turn, the script displays the current board and prompts the user for a move.
#  It may either have two human players or a human player and a computer player that chooses a move randomly.
#  
#  ## Normal Mode
#  
#  The script should fulfill the *Easy Mode* requirements and support both a human **and** computer second player.
#  
#  ## Nightmare Mode
#  
#  Add better AI (hardcoding "if the board is this, play this" is tractable, but there are other approaches, depending on how nightmarish you want to go).
#  #  Write your own NATO alphabet.There should be a function to encode and decode.The 
#  * Running `ruby tic-tac-toe.rb` should play a game of tic-tac-toe in the terminal.
#  
#
######

#patorjk.com text to ascii art - google



#################################################################
####################### User interface ##########################
#################################################################

def start_game
  load_start_screen
  display_board
end

def load_start_screen
  display_art
  "puts: hit any button to continue"
  key_down_any_button #function for hitting any button as input wihtout "gets"
  choose_mode #when user hits a button
end

def key_down_any_button
  #function for hitting any button as input wihtout "gets"
end

def choose_mode
  "which mode would you like to play?"
  #query_user = validate(gets)
  #computer_or_human_oppoenet? if choose_mode == 'Easy' || 'Normal'
end


def validate(user_input, options)
  selection_options = [1,2,3,4]
  game_options = {1 => 'Easy', 2 => 'Normal', 3 => 'Hard', 4 => 'Nightmare'}
  oponnent_options = {1 => 'Human', 2 => 'Computer'}
  menu_response unless selection_options.include?(user_input)

end

def menu_response
  p "we need you to select the number option "
  #validate(gets)
end

def computer_or_human_oppoenet?
  puts 'choose the setup:   1) Human   2)Computer'
  #query_user = validate(gets)
  key_down_any_button #get function for hitting any button as input wihtout "gets"
end






def play_game
  until check_winner(board)
    player1_turn
    player2_turn
    refresh_board
    display_board
  end
end

def three_in_a_row? (index)
  index.uniq.length == 1 && !index.include?('')
end

def player1_turn

end

def player2_turn

end

def refresh_board

end


def board
                #0
  board = [['1','2','3'],
                #1
           ['4','5','6'],
                #2
           ['7','8','9']]
end

def check_winner(board)
diagonal_159 = []
diagonal_357 = []
winning_combinations = []
  board.each_with_index do |row, i|
    winning_combinations << row
    diagonal_357 << row.reverse[i]
    diagonal_159 << board[i][i]
    winning_combinations << board.transpose[i]
  end
winning_combinations << diagonal_159
winning_combinations << diagonal_357
winning_combinations.map {|combo| three_in_a_row?(combo)}.include?(true) 
end


def play_tic_tac_toe
  start_game
  play_game
end
                   #0
test_board = [['1','6','3'],
                   #1
              ['4','5','6'],
                   #2
              ['7','8','9']]


check_winner(test_board)

