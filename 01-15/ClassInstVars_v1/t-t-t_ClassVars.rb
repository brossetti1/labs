require 'pry'
require '../gameart'

######
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


class Board
  WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6]]
  include GameArt

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2 || nil
  end

  def choose_mode(board)
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

#open board spots --- board.map {|spot| spot.scan(/\d/)}.flatten

#      Board                Index
# 1  |  2  |   3       0  |  1  |  2
# 4  |  5  |   6       3  |  4  |  5
# 7  |  8  |   9       6  |  7  |  8

  def board
    ['1','2','3','4','5','6','7','8','9']
  end

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

  def winner?(board) ################ not sure yet
    WINS.any? do |a,b,c|
      if board[a] == board[b] && board[b] == board[c]
        return board[a]
      end
    end
  end
  
  def finished?(board) ################## not sure yet
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
  

end


class Player


  def initialize(name)
    @name = name.gets
    @letter = choose_letter
  end

  #need to determine if board has 2 players or 1

  def choose_letter
    query_user = prompt("do you want to play 'X' or 'O'?",['x','o'],
                        "select the letter you want to play",keep_text=true)
    player = query_user.upcase
  end
  

  def choose_square(board, configuration, count)
    #binding.pry
    prompt_text = "#{self.name}, pick an open number on the board"
    open_board_spots = board.reject {|spot| spot.to_i == 0}
    error_text = '!!!!!!!!!!!you need to pick an open spot on the board!!!!!!!!!!!'
    if configuration[0] == 1
      pick = prompt(prompt_text, open_board_spots, error_text)
    elsif count.odd?
      pick = prompt(prompt_text, open_board_spots, error_text)
    elsif count.even?
      pick = bot_choice(board, configuration).to_i
    end
    board[pick-1]
  end
  #open board spots --- board.map {|spot| spot.scan(/\d/)}.flatten
  #WINS = [[0,3,6], [1,4,7], [2,5,8], [0,1,2], 
  #        [3,4,5], [6,7,8], [0,4,8], [2,4,6]]
  #      Board                Index
  # 1  |  2  |   3       0  |  1  |  2
  # 4  |  5  |   6       3  |  4  |  5
  # 7  |  8  |   9       6  |  7  |  8

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

end



player_a = Player.new('Brian')
player_b = Player.new('Patrick')
board = Board.new(player_a, player_b)

board.play_game






