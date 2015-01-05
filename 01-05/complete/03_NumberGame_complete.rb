
def check(num)
  until num.to_i.class == Fixnum
    if num.class != Fixnum || Float
     puts "That was not a number, try again: "
     num = gets.to_i
   end
 end
end


def guessGame
  puts number = "pick a number between 0 and 100: "
  num = gets.to_i; puts num.class; check(num);
  #check = if num.class != Fixnum; puts "That was not a number, try again: "; end
  randNum = rand(100)
  until num == randNum
    if num < randNum
      puts "#{num} is lower than the number, guess again: "
      num = gets.to_i; check(num)
    elsif num > randNum
      puts "#{num} is higher than the number, guess again: "
      num = gets.to_i; check(num)
    end
  end
  puts "You got it bro/ladybro, you win, how awesome does that feel?"
end


puts 50.class == Fixnum
puts 50.class != Fixnum

guessGame

