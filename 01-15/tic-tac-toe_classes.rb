require 'pry'
require './gameart'

######
#  
#  Tick-Tac-Toe Day 9 Classes for IronYard Spring Jan 15, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#
#   In this assignment, we'll revisit and refactor
#   [our previous tic-tac-toe](https://github.com/TIY-ATL-ROR-2015-Jan/labs/tree/master/01-08/questions.md)
#   implementation with an eye towards testability, maintainability,
#   object oriented design, and code quality.
#   
#   ## Objectives
#   
#   ### Learning Objectives
#   
#   After completing this assignment, you should…
#   
#   * Understand basic OO principles
#   * Appreciate the difficulty of changing code, and think about ways to make it easier
#   * Be comfortable writing tests and structuring code to be testable
#   
#   ### Performance Objectives
#   
#   After completing this assignment, you be able to effectively use
#   
#   * `class`es and `module`s to encapsulate logic
#   * `minitest` to write and run tests
#
######

WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6]]

#curtosey of http://www.ranker.com/crowdranked-list/the-best-robots-of-all-time
BOTNAMES = ['R2-D2' ,'Bender','Terminator' ,'Data' ,'C-3PO' ,'WALL·E' ,'Optimus Prime','The Iron Giant' ,'HAL 9000' ,
         'T-1000' ,'Roy Batty' ,'KITT' ,'Marvin the Paranoid Android','Tom Servo','Eve' ,'Johnny 5' ,'Rosie the Robot Maid' ,
         'ED-209' ,'Bishop' ,"The robot from 'Lost in Space'" ,'Number Six' ,'Sonny' ,'Cylon' ,'Crow T. Robot' ,
         'Mechagodzilla' ,'Dalek' ,'Bumblebee' ,'Calculon' ,'The Sentinels' ,'Robby the Robot' ,'Astro Boy' ,'Gort',
         'GIR' ,'Fembots' ,'V.I.N.CENT' ,'Maria Robot' ,'Kryten' ,'K-9' ,'The Gunslinger' ,'Maximillian' ,'Cameron',
         'Borg Queen' ,'Gundam' ,'Seven of Nine' ,'The Mars Rover' ,'HK-47' ,'Mega Man' ,'General Grievous' ,
         'Steve Austin' ,'Twiki' ,'Sentinel' ,'Motoko Kusanagi' ,'Ultron' ,'Geoffrey Peterson' ,'Wheatley' ,
         'RoboCop' ,'Voltron' ,'Ash' ,'GLaDOS' ,'Dot Matrix' ,'Cyberman' ,'Lore' ,'Bicentennial Man' ,'Red Tornado' ,'Clank',
         'V\'ger','Robot Bill and Ted' ,'Vision' ,'Ratchet' ,'Jinx' ,'Box' ,'T-X' ,'Roomba' ,'Megas' ,'Brainiac' ,'Baymax' ,
         'Asimo' ,'Metal Sonic' ,'Brainiac 5' ,'Android 18' ,'Maximillion' ,'Cell' ,'Hector'] 

class Game

  include GameArt

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = ['1','2','3','4','5','6','7','8','9']
  end

  def load_start_screen
    game_title
    center("hit any button to continue")
    puts "\n\n\n"
    puts show_board(@board)
    key_down_any_button
  end
  
  def center(text, space = "")
    puts "\n\n\n"
    print " "*((178-text.chomp.size)/2)
    print text
    puts
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

  def refresh_screen
    puts `clear`
    game_title
    puts "\n\n\n\n"
    puts show_board(@board)
  end

  def winner? ################ not sure yet
    WINS.any? do |a,b,c|
      if @board[a] == @board[b] && @board[b] == @board[c]
        return @board[a]
      end
    end
  end
  
  def finished?
    @board.all? {|space| space == 'X' || space == 'O'}
    ###play again????? --> make method
  end
  
  def play_game
    load_start_screen
    refresh_screen
    player1_letter = @player1.choose_letter
    player2_letter = player1_letter == "X" ? "O" : "X"
    refresh_screen
    until winner? || finished?
      @player1.choose_square(@board, player1_letter)
      refresh_screen
      break if winner? || finished?
      @player2.choose_square(@board, player2_letter)
      refresh_screen
    end
  
    if winner?
      center("\n\n\ncongradulations player #{winner?}, you win")
    else
      center("\n\n\nits a draw")
    end
  end
end


class Player
  attr_reader :name

  def initialize(name = 'anonymous')
    @name = name
  end

  def get_name
    puts "whats your name bro?"
    @name = gets.chomp
    until @name =~ /\A[[:alnum:]]+\z/
      puts "you can you a combination of alphhanumeric and symbol characters"
      @name = gets.chomp
    end
  end

  def choose_mode
    puts `clear`
    query_user = prompt("would you like to play a 1) Human vs Human 2) Human vs Computer 3) Computer vs Computer?", 
                        [1,2,3], "please select a number option")
    case
    when query_user == 2
      puts `clear`
      center("select the number corresponding to which mode you would like to play?")
      difficulty1 = prompt("1) Easy   2)Normal   3)Hard   4) Nightmare",
                           [1,2,3,4], "please select a number option")
      difficulty2 = 0
    when query_user == 3
      puts `clear`
      center("which mode would you like the COMPUTER #1 to play?")
      difficulty1 = prompt("1)Easy   2)Normal   3)Hard   4) Nightmare",
                           [1,2,3,4], "please select a number option")
      center("which mode would you like the COMPUTER #2 to play?")
      difficulty2 = prompt("1) Easy   2)Normal   3)Hard   4) Nightmare",
                           [1,2,3,4], "please select a number option")
    else
      difficulty1 = 0
      difficulty2 = 0
    end
    return query_user, difficulty1, difficulty2
  end

  def choose_letter
    query_user = prompt("do you want to play 'X' or 'O'?",['x','o'],
                        "select the letter you want to play",keep_text=true)
    player = query_user.upcase
  end

  def center(text, space = "")
    puts "\n\n\n"
    print " "*((178-text.chomp.size)/2)
    print text
    puts
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

  def choose_square(board, player) #might not need count
    open_board_spots = board.reject {|spot| spot.to_i == 0}
    pick = prompt("#{@name}, pick an open number on the board", 
                    open_board_spots, 
                    '!!!!!!!!!!!you need to pick an open spot on the board!!!!!!!!!!!')
    board[pick-1] = player
  end
end


class Computer

  attr_reader :name

  def initialize(configuration)
    @configuration = configuration
    @name = BOTNAMES.sample
  end
  #WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], 
  #        [3,4,5], [6,7,8], [0,4,8], [2,4,6]]
  #
  #                 BOARDs
  #      Board                Index
  # 1  |  2  |   3       0  |  1  |  2
  # 4  |  5  |   6       3  |  4  |  5
  # 7  |  8  |   9       6  |  7  |  8

  def choose_square(board, player) #might not need count
    config = @configuration[1]
    available_moves = board.reject {|spot| spot.to_i == 0} 
    open_pick = available_moves.sample.to_i
    save_game_picks = []
    if config == 1 ######## Easy Mode #########
      board[open_pick-1] = player
    elsif config == 2 ######## Normal Mode #######
      WINS.any? do |a,b,c|
        if board[a] == board[b] || board[a] == board[c] || board[c] == board[b]
          save_game_picks << board[c].to_i if board[a] == board[b]
          save_game_picks << board[b].to_i if board[a] == board[c]
          save_game_picks << board[a].to_i if board[c] == board[b]
        end
      end
      #add a WINs analyzer that goes for victory instead of playing defensively
      save_game_pick = save_game_picks.keep_if {|item| available_moves.include?(item.to_s)}
      save_game_pick.empty? ? pick = open_pick : pick = save_game_pick[0]
      board[pick-1] = player
    elsif config == 3 ######## Hard Mode #########
      WINS.any? do |a,b,c|
        if board[a] == board[b] || board[a] == board[c] || board[c] == board[b]
          save_game_picks << board[c].to_i if board[a] == board[b]
          save_game_picks << board[b].to_i if board[a] == board[c]
          save_game_picks << board[a].to_i if board[c] == board[b]
        end
      end
      save_game_pick = save_game_picks.keep_if {|item| available_moves.include?(item.to_s)}
      save_game_pick.empty? ? pick = open_pick : pick = save_game_pick[0]
      board[pick-1] = player
    else  ########  Nightmare Mode  ############
      #do nightmare stuff 
    end
  end

  def check_board
    
  end

  def choose_letter
    ['X','O'].sample
  end
end






