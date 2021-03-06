#########
#  hangman Day 7 for IronYard Spring Jan 13, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5d
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#
#  Brit constructed the first bit of hangman and we had to finish the game. 
#########

require 'pry'
require 'set'
words = %w(angus
           onomatopeia
           mississippi
           cookies
           terminal
           illness
           communist
           dictator
           capitalist
           marxist
           darwinism)



class Player
  attr_reader :answer
  attr_accessor :guessed, :prompt, :game_word

  def initialize(words, game_name="")
    @game_name = game_name
    @guessed = Set.new
    @turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
    @answer = words.sample
    @game_word = @answer.gsub(/[A-z]/, "-")
  end

  def prompt_player
    puts "go ahead tough guy/girl, take a guess.  word: #{@game_word} turns left: #{@turn_count}"
    guess = check(gets.chomp)
    @guessed.add(guess)
    @answer.include?(guess) ? letter_match?(guess) : @turn_count -= 1
  end

  def letter_match?(guess)
    if @answer.chars.include?(guess)
      @answer.chars.each_with_index do|l, i|
        @game_word[i] = l if l == guess
      end
    end
  end

  def check(guess)
    until guess =~ /^[a-z]$/i && !@guessed.include?(guess)
      binding.pry
      if @guessed.include?(guess)
        puts 'come on you already picked that one, pick again'
        guess = check(gets.chomp)
      else
        puts 'we need one letter.... bucko'
        guess = check(gets.chomp)
      end
    end
    guess.downcase
  end

  def word_complete?
    @answer.chars.uniq.all? {|l| @guessed.include? l }
  end

  def finished?
    word_complete? || @turn_count == 0
  end

  def game_over
    if word_complete?
      puts 'hey, you won, now go do something with your life.'
    else
      puts 'sorry you lost, hope your not sad'
    end
  end

  def take_turn
    puts "your turn on game: #{@game_name}"
    prompt_player
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

  def greeting
    puts "welcome to #{@game_name} of hangman, press any key to continue"
    key_down_any_button
  end

  def play_game
    take_turn
    puts "word: #{@game_word}\n\n\n"
    return game_over if finished?
  end
end


game1 = Player.new(words, 'Game 1')
game2 = Player.new(words, 'Game 2')

game1.greeting
game2.greeting
until game1.finished? && game2.finished?
  game1.play_game
  game2.play_game
end

