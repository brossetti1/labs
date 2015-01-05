
def guessGame
  puts number = "pick a number between 0 and 100: "
  num = check(gets).to_i
  randNum = rand(100)
  until num == randNum
    if num < randNum
      puts "#{num} is lower than the number, guess again: "
      num = check(gets).to_i
    elsif num > randNum
      puts "#{num} is higher than the number, guess again: "
      num = check(gets).to_i
    end
  end
  puts "You got it bro/ladybro, you win, how awesome does that feel?"
end


def check(num)
  until /^[\d]+(\.[\d]+){0,1}$/ === num
    puts "That was not a number, try again: "
    num = gets
  end
  num
end


guessGame
