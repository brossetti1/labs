######
#
#  NATO Alphabet Day 2 for IronYard Spring Jan 06, 2015
#
#  Programmer:    Brian Rossetti
#  OS:            Yosemite 10.10.1
#  System:        Intel Core i5
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
#
#  Purpose
#
#  Write your own NATO alphabet.There should be a function to encode and decode.The 
#  encode function will take a string replace all upper and lowercase characters with 
#  their "NATO" equivalents and return the result.The decode function will take 
#  a string, replace the "NATO" characters with their normal letter form and return
#  that. Non-alphabetical should be copied/stay the same in both cases.
#
######


#LAPD NATO alphabet with a few edits on the numbers
NATO = {:A => :Adam, :B => :Boy, :C => :Charles, :D => :David, :E => :Edward, :F => :Frank, :G => :George, :H => :Henry, :I => :Ida,
        :J => :John, :K => :King, :L => :Lincoln, :M => :Mary, :N => :Nora, :O => :Ocean, :P => :Paul, :Q => :Queen, 
        :R => :Robert, :S => :Sam, :T => :Tom, :U => :Union, :V => :Victor, :W => :William, :X => :Xray, :Y => :Young, 
        :Z => :Zebra, 0 => :Zorro, 1 => :OneToMany, 2 => :TwoTurtleDoves, 3 => :ThreeRedHens, 4 => :Formula, 5 => :HighFive,
         6 => :SixMil, 7 => :SevenMinutesInHeaven, 8 => :EightOClock, 9 => :Niner}


#regular expresion to check for a number value
IS_A_NUMBER = /^[\d]+(\.[\d]+){0,1}$/



def encode(str)
  encode_NATO = []
  str.to_s.each_char do |char|
    encode_NATO << NATO[char.upcase.to_sym].id2name unless char =~ IS_A_NUMBER
    encode_NATO << NATO[char.to_i] if char =~ IS_A_NUMBER
  end
  encode_NATO.join(" ")
end



def decode(str)
  reverse_NATO = NATO.invert
  decode_NATO = []
  str.to_s.split.each do |word|
    index = reverse_NATO[word.to_sym]
    decode_NATO << index.id2name if index.class == Symbol
    decode_NATO << index if index.is_a? Numeric
  end
  decode_NATO.join("")
end




p encode('klnadv231')

p decode("King Lincoln Nora Adam David Victor TwoTurtleDoves ThreeRedHens OneToMany")