require 'pry'
require_relative 'game_art'

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

   #0
BOARD = [['1','2','3'],
              #1
         ['4','5','6'],
              #2
         ['7','8','9']]

def start_game
  load_start_screen
  #3.times {|x| puts}
  #BOARD.each {|piece| print piece, "\n"}
  #10.times {|x| puts}
end

def load_start_screen
  game_title
  center("hit any button to continue")
  key_down_any_button
end

#not sure if this works yet....
def center(text, space = "")
  if space == 'puts'
    puts
    print " "*((164-text.chomp.size)/2)
    print text
    puts
  elsif space == 'align_middle'
    print " "*((164-text.chomp.size)/2)
    print text
  else
    print " "*((164-text.chomp.size)/2)
    print text
    puts
  end
end

#curosey of Matz - http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2999
def key_down_any_button
  begin
    system("stty raw -echo")
    str = STDIN.getc
  ensure
    system("stty -raw")
    puts `clear`
  end
end

def choose_mode
  refresh_screen
  options = {1 => 'Human', 2 => 'Computer'}
  center('1) Human   2) Computer')
  query_user = validate(gets.to_i, [1,2], options)
  if query_user == 2
    options = {1 => 'Easy', 2 => 'Normal', 3 => 'Hard', 4 => 'Nightmare'}
    center("select the number corresponding to which mode you would like to play?")
    print "                                                          "
    options.each {|k,v| print "#{k})  #{v}   "}
    center("please select a number option",'puts')
    query_user = validate(gets.to_i, [1,2,3,4], options)
  end
  options[query_user]
end

def computer_or_human(choose_mode)
  choose_mode
end

def validate(user_input, validate, options = {})
  if validate.include?(user_input)
    return user_input
  else
    refresh_screen
    center("select the number corresponding to which mode you would like to play") if validate.length == 4
    print "                                                         " if validate.length == 4
    print "                                                                       " if validate.length == 2
    options.each {|k,v| print "#{k}) #{v}   "}
    center("please select a number option",'puts')
    print "we need you to select the number option: "
    validate(gets.to_i, validate, options)
  end
end

def display_board
  refresh_screen
  puts show_board.each {|part| part}
end

def refresh_screen(board = "")
  puts `clear`
  game_title
  BOARD.each {|piece| print piece, "\n"} if board == 'board'
end

def play_game
  start_game
  mode = computer_or_human(choose_mode)
  until check_winner
    player1_turn(mode)
    BOARD.each {|piece| print piece, "\n"}
    break if check_winner
    player2_turn(mode)
    BOARD.each {|piece| print piece, "\n"}
  end
end

def player1_turn(mode)
  players_pick('X', 'Human')
end

def player2_turn(mode)
  players_pick('O', mode)

end

def players_pick(player, mode)
  index_reference = [[1,0],[2,1],[3,2],[4,0],[5,1],[6,2],[7,0],[8,1],[9,2]]
  player == 'X' ? current_player = "player X" : current_player = "player O"
  refresh_screen('board')
  puts "#{current_player}, pick any number between 1-9 as referenced on the board"
  if mode != "Human" 
    pick = computer_pick(mode)
    check_player_pick(pick,index_reference,player)
    binding.pry
  else
    pick = check_player_pick(gets.to_i - 1, index_reference, player) # 3 == 2 == [3,[0,2]]
  end
end


def check_player_pick(pick, picks, player)
  play_index = picks[pick][1] unless pick > 9
  board_ref = BOARD[0] if [1,2,3].include?(pick+1)
  board_ref = BOARD[1] if [4,5,6].include?(pick+1)
  board_ref = BOARD[2] if [7,8,9].include?(pick+1)
  if pick == -1 || pick > 9
    refresh_screen('board')
    puts "you need to select a number between 1 and 9 to play"
    check_player_pick(gets.to_i-1, picks, player)
  elsif ["X","O"].include?(board_ref[play_index])
    refresh_screen('board')
    puts "you have to pick an open spot on the board"
    check_player_pick(gets.to_i - 1, picks, player)  
  elsif picks[pick].include?(pick+1) && !["X","O"].include?(board_ref[play_index])
    board_ref[play_index] = player
  end
end

def computer_pick(mode)
  if mode == 'Easy'
    picks = (1..9).to_a
    picks.shuffle.pop
  elsif mode == 'Normal'
    #stuff
  elsif mode == 'Hard'
    #stuff
  else
    #stuff
  end
end

def check_winner
diagonal_159 = []
diagonal_357 = []
winning_combinations = []
BOARD.each_with_index do |row, i|
  winning_combinations << row
  diagonal_357 << row.reverse[i]
  diagonal_159 << BOARD[i][i]
  winning_combinations << BOARD.transpose[i]
end
winning_combinations << diagonal_159
winning_combinations << diagonal_357
winning_combinations.map {|combo| three_in_a_row?(combo)}.include?(true)
end

def three_in_a_row? (index)
  index.uniq.length == 1 && !index.include?('*')
end

                   #0
#test_board = [['*','*','*'],
#             #  0   1   2
#                   #1
#              ['*','*','*'],
#             #  0   1   2
#                   #2
#              ['*','*','*']]
#             #  0   1   2
#


play_game



