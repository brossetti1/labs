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



WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6]]

def load_start_screen(board)
  game_title
  center("hit any button to continue")
  puts "\n\n\n"
  puts show_board(board)
  key_down_any_button
end

#not sure if this works yet....
def center(text, space = "")
  if space == 'puts'
    puts
    print " "*((178-text.chomp.size)/2)
    print text
    puts
  elsif space == 'align_middle'
    print " "*((178-text.chomp.size)/2)
    print text
  else
    puts "\n\n\n"
    print " "*((178-text.chomp.size)/2)
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

def prompt(text, options, error_msg, keep_text=false)
  center(text)
  query_user = gets.chomp

  until query_user =~ /^[#{options.join}]$/i
    center(error_msg)
    query_user = gets.chomp
  end
  keep_text ? query_user : query_user.to_i
end

def refresh_screen(board)(board)
  puts `clear`
  game_title
  puts "\n\n\n\n"
  puts show_board(board)
end

def choose_mode
  refresh_screen(board)
  query_user = prompt("would you like to play a 1) Human or 2) Computer?", 
                      [1,2], "please select a number option")
  if query_user == 2
    refresh_screen(board)
    center("select the number corresponding to which mode you would like to play?")
    difficulty = prompt("1) Easy 2)Normal 3)Hard 4) Nightmare",
                         [1,2,3,4], "please select a number option")
  else
    difficulty = 0
  end
  return query_user, difficulty
end

def choose_letter
  query_user = prompt("do you want to play 'X' or 'O'?",['x','o'],
                      "select the letter you want to play",keep_text=true)
  player = query_user.upcase
end

def choose_square(board, player, configuration, count)
  #binding.pry
  prompt_text = "player #{player}, pick an open number on the board"
  open_board_spots = board.reject {|spot| spot.to_i == 0}
  error_text = '!!!!!!!!!!!you need to pick an open spot on the board!!!!!!!!!!!'
  if configuration[0] == 1
    pick = prompt(prompt_text, open_board_spots, error_text)
  elsif count.odd?
    pick = prompt(prompt_text, open_board_spots, error_text)
  elsif count.even?
    pick = bot_choice(board, configuration).to_i
  end
  board[pick-1] = player
end
#open board spots --- board.map {|spot| spot.scan(/\d/)}.flatten
#WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], 
#        [3,4,5], [6,7,8], [0,4,8], [2,4,6]]
#      Board                Index
# 1  |  2  |   3       0  |  1  |  2
# 4  |  5  |   6       3  |  4  |  5
# 7  |  8  |   9       6  |  7  |  8

##board

#def bot_choice(board, configuration)
#  config = configuration[1]
#  case 
#  when config == 1 #Easy Mode
#    win_options(board,configuration)
#  when config == 2 #Normal mode
#    win_options(board, configuration)
#  when config == 3 #Hard mode
#    win_options(board, configuration)
#  when config == 4 #Nightmare mode
#    #do Nightmare stuff
#  end
#end


def bot_choice(board, configuration)
  config = configuration[1]
  available_moves = board.reject {|spot| spot.to_i == 0} 
  if config == 1 ######## Easy Mode #########
    pick_move
  elsif config == 2 ######## Normal Mode #######
    WINS.any? do |a,b,c|
      if board[a] == board[b] || board[a] == board[c] || board[c] == board[b]
        return board[c] if board[a] == board[b]
        return board[b] if board[a] == board[c]
        return board[a] if board[c] == board[b]
      end
    end
    available_moves.shuffle.first
  elsif config == 3 ######## Hard Mode #########
    WINS.any? do |a,b,c|
      if board[a] == board[b] || board[a] == board[c] || board[c] == board[b]
        return board[c] if board[a] == board[b]
        return board[b] if board[a] == board[c]
        return board[a] if board[c] == board[b]
      end
    end
    #WINS.
  else  ########  Nightmare Mode  ############
    #do nightmare stuff
    
  end
end

def winner?(board)
  WINS.any? do |a,b,c|
    if board[a] == board[b] && board[b] == board[c]
      return board[a]
    end
  end
end

def finished?(board)
  board.all? {|space| space == 'X' || space == 'O'}
end

def play_game(board)
  count = 1
  load_start_screen(board)
  configuration = choose_mode
  refresh_screen(board)
  player1 = choose_letter
  player2 = player1 == "X" ? "O" : "X"
  refresh_screen(board)
  until winner?(board) || finished?(board)
    choose_square(board, player1, configuration, count)
    count += 1
    refresh_screen(board)
    break if winner?(board) || finished?(board)
    choose_square(board, player2, configuration, count)
    count += 1
    refresh_screen(board)
  end

  if winner?(board) == "X" || winner?(board) == "O"
    puts "congradulations player #{winner?(board)}, you win"
  else
    puts "its a draw"
  end
end
#open board spots --- board.map {|spot| spot.scan(/\d/)}.flatten
#WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], 
#        [3,4,5], [6,7,8], [0,4,8], [2,4,6]]
#      Board                Index
# 1  |  2  |   3       0  |  1  |  2
# 4  |  5  |   6       3  |  4  |  5
# 7  |  8  |   9       6  |  7  |  8
def board
  ['X','X','O','O','O','6','X','8','9']
end

def find_corners(picks)
  if picks.include?([0,6,2,8])
  end
end

counts = Hash.new(0)
win_num_count = WINS.flatten
win_num_count.each {|sqr| counts[sqr] += 1 unless sqr == 'X' || sqr == 'O'}
#p counts
board_remain = board.map {|spot| spot.scan(/\d/)}.flatten
p board_remain
x = WINS
x.reject do |ary| 
  board_remain.each do |num|
  end
end

#play_game(board)


def check_wins
  hsh = Hash.new(:test => 0)
  board_remain = board.reject {|spot| spot.to_i == 0} 
  p board_remain
  p WINS
  WINS.each_with_index do |ary, i|
    board_remain.each do|spot|
      p ary, i, spot
      p board_remain.include?(i.to_s)
      p hsh[i.to_s.to_sym] = [] if board_remain.include?(i.to_s)
    end 
  end
  #  binding.pry
  #  
  #  hsh[i.to_s.to_sym] << [spot-1, ary] if ary.include?(spot-1.to_i) == true
  #end
  hsh
end

p check_wins
