######
#  hangman Day 3 for IronYard Spring Jan 06, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5d
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#
#  Brit constructed the first bit of hangman and we had to finish the game. 
######

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

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  player_answer = answer.gsub(/[[:alpha:]]/, "-")
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(turn_count, guessed, answer, player_answer)
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(answer, guessed) # TODO: Do I need an argument?
end

def prompt_player(count, guessed, answer, player_answer)
  p "whats yo guess? you have #{count} turns left  word: #{player_answer}"
  player_guess = check($stdin.gets)
  replace_index_with_letter(player_answer, answer, player_guess, guessed)
  player_guess
end

def finished?(turns, guesses, answer)
  turns.zero? || complete_word?(answer, guesses)
end

def game_over(answer, guesses)
  if complete_word?(answer, guesses)
    p "word: #{answer}, you won, high five"
  else
    p 'you lose, sucker'
  end
end

def replace_index_with_letter(player_answer, answer, player_guess, guessed)
  if answer.include?(player_guess) && !guessed.include?(player_guess)
    answer.chars.each_with_index do |letter, i|
      player_answer[i] = letter if letter == player_guess
    end
  else
    player_guess
  end
end

def complete_word?(answer, guesses)
  answer.chars.all? { |l| guesses.include?(l) }
end

def check(input)
  if /[[:alpha:]]/ =~ input && input.chomp.length == 1
    input.to_str.chomp
  else
    p 'we need a letter.'
    check($stdin.gets)
  end
end

hangman(words)
