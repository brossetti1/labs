######
#
#  Homework Day 1 for IronYard Spring Jan 05, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#  Create a number guessing game. Game should pick a random number
#  between 1 and 100 and ask you for a guess. If the guess is less than
#  the number, inform the user and let them guess again. If the guess is
#  greater than the number, inform the user and let them guess again. If
#  the guess is correct, inform the user.
#
######


def guessGame
  puts "pick a number between 0 and 100: "
  num = check(gets)
  randNum = rand(100)
  until num == randNum
    if num < randNum
      puts "#{num} is lower than the number, guess again: "
      num = check(gets)
    elsif num > randNum
      puts "#{num} is higher than the number, guess again: "
      num = check(gets)
    end
  end
  puts "You got it bro/ladybro, you won this wierd game, how awesome does that feel?"
end


#regex input validation determines if a Float or Number is given.

def check(num)
  until /^[\d]+(\.[\d]+){0,1}$/ === num
    puts "That was not a number, try again: "
    num = gets
  end
  num.to_i
end


guessGame
