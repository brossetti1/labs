## BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']



def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting(turn_count)
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
  p "whats yo guess? word: you have #{count} turns left  word: #{player_answer}"
  player_guess = check(gets)
  replace_index_with_letter(player_answer, answer, player_guess, guessed)
  player_guess
end

def finished? (turns, guesses, answer)
  turns.zero? || complete_word(answer, guesses)
end

def greeting(attempts)
  puts 'Welcome to hangman, you have #{attempts} attempts to guess the word'
end

def game_over(answer, guesses)
  if complete_word(answer, guesses)
    p "you won, high five"
  else
    p "you lose"
  end
end



def replace_index_with_letter(player_answer, answer, player_guess, guessed)
  if answer.include?(player_guess) && !guessed.include?(player_guess)
    answer.each_char.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
  else
    player_guess
  end
end

def complete_word(answer, guesses)
  answer.chars.all? { |l| guesses.include?(l) }
end

def check(input)
  if /[[:alpha:]]/ =~ input && input.chomp.length == 1 
    input.to_str.chomp
  else
    p "we need a letter."
    check(gets)
  end
end

##def check_guessed(letter, guessed)
##  if guessed.include?(letter)
##    p "you already guessed that"
##    check(gets)
##  else
##    skip
##  end
##end



hangman(words)
