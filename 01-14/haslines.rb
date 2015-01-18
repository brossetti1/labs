module HasLines 

  def roll_dice(sides)
    puts "rolling a d#{sides}"
    (1..sides).to_a.sample
  end

  def dialogue(text, opponent)
    case       
    when text == 'dodge_intro'
      puts "roll a dice to determine your total dodge potentional 
            against the #{opponent.name}."
    when text == 'dodge'
      puts "you use your quickness to attempt to avoid the 
            #{opponent.class}'s death blows"

    when text == "hiss_intro"
      puts 'some creatures out there will respect you more if you 
            stand your ground, this is your chance to prove that your not scared.'
    when text == 'hiss'
      puts "you turn towards the #{opponent.class} and hiss."

    when text == 'climb_intro'
      puts 'you may not be able to defend yourself, but you can climb 
            faster than most things.'
    when text == 'climb'
      puts "you attempt to climb to the high ground to avoid the 
            #{opponent.class}'s pursuit."

    when text == 'kitten_eyes_intro'
      puts 'This abiliity will help save you by depending on your opponents 
            sympathy towards kittens'
    when text == 'kitten_eyes'
      puts "you stop, slowly stare into your oppenents eyes, and give them your 
            most adorable look, roll a dice to see if you distract them for minus turns"

    when text == 'scream'
      puts "the lady with the vacuum has a phobia of kittens, she puts her vacuum down and 
      screams in your direction at an alarmingly damaging pitch"

    when text == 'abilities'
      puts "select the ability you want to use against #{opponent.name}"
      puts "1) kitten dodge\n"
      puts "2) hiss\n"
      puts "3) climb\n"
      puts "4) kitten_eyes\n"
    else
      puts text, opponent
    end
  end

  def test_method
    self.methods - Object.new.methods - Array.new.methods - HasLines.instance_methods - self.instance_variables.map {|var| var.to_s[1..-1].to_sym}
  end



end 
