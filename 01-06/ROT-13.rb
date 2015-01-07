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


def encode(input)
  input.to_str.each_char do |char| 
    p get_index(char)
    binding.pry
  end
end


def decode(input)

end


def get_index(char)
  if char == char.upcase ? ROT_TABLE[1].find_index(char.to_sym) : ROT_TABLE[0].find_index(char.to_sym); end
end

p get_index('D')
p ROT_TABLE[1].find_index('t'.to_sym)
p ROT_TABLE[0].find_index('E'.to_sym)
p 'd' == 'd'.upcase
p 'd' == 'd'.downcase


encode('datTTT')


decode('bootie')