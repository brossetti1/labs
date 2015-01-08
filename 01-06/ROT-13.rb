######
#
#  ROT-13 Day 2 for IronYard Spring Jan 06, 2015
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
#
#  Look at the wikipedia page for [ROT-13][rot13].
#  Try to write an encoder and decoder for
#  ROT-13.
#  
#  [rot13]: http://en.wikipedia.org/wiki/ROT13
#
#
######
require 'pry'

ROT_TABLE = [[:A,:B,:C,:D,:E,:F,:G,:H,:I,:J,:K,:L,:M,:N,:O,:P,:Q,:R,:S,:T,:U,:V,:W,
            :X,:Y,:Z],[:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,
            :u,:v,:w,:x,:y,:z]]
#ROT_TABLE array lengths = 26 -> 0 - 25

def rot13_encode_or_decode(cypher)
  p "pass a word to #{cypher} into ROT13, characters will be ignored unless they are spaces or alphabetic"
  input = gets
  rot13_encode_word = []
  input.gsub(/[^\p{Alpha}\p{Blank}-]/, '').each_char do |char| 
    rot13_index = locate_ROT13_index(char, cypher)
    rot13_encode_word << get_ROT_array(char)[rot13_index].to_s unless char == " "
    rot13_encode_word << char if char == " "
  end
  rot13_encode_word.join("").strip
end

def get_letter_index(char)
  get_ROT_array(char).find_index(char.to_sym) unless char == " "
end

def get_ROT_array(char)
  char == char.upcase ? ROT_TABLE[0] : ROT_TABLE[1] unless char == " "
end

def locate_ROT13_index(char, cypher)
  return " " if char == " "
  if cypher == 'encode'
    if get_letter_index(char) + 13 > 25
      get_letter_index(char) + 13 - 26
    else
      get_letter_index(char) + 13
    end
  elsif cypher == 'decode'
    if get_letter_index(char) - 13 < 0
      26 - (13 - get_letter_index(char))
    else
      get_letter_index(char) - 13
    end
  else
    p "we need you to indicate if you want to encode or decode into ROT13"
    rot13_encode_or_decode(cypher)
  end
end


p rot13_encode_or_decode('encode')


p rot13_encode_or_decode('decode')



