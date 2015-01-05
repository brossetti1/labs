here are all the methods that string responds which symbol does not:

string = "hello"
symbol = :hello
string.methods - symbol.methods #=>

[:+, :*, :%, :[]=, :insert, :bytesize, :succ!, :next!, :upto, :index, 
 :rindex, :replace, :clear, :chr, :getbyte, :setbyte, :byteslice, :scrub, 
 :scrub!, :to_i, :to_f, :to_str, :dump, :upcase!, :downcase!, :capitalize!, 
 :swapcase!, :hex, :oct, :split, :lines, :bytes, :chars, :codepoints, :reverse, 
 :reverse!, :concat, :<<, :prepend, :crypt, :ord, :include?, :start_with?, 
 :end_with?, :scan, :ljust, :rjust, :center, :sub, :gsub, :chop, :chomp, 
 :strip, :lstrip, :rstrip, :sub!, :gsub!, :chop!, :chomp!, :strip!, :lstrip!, 
 :rstrip!, :tr, :tr_s, :delete, :squeeze, :count, :tr!, :tr_s!, :delete!, :squeeze!, 
 :each_line, :each_byte, :each_char, :each_codepoint, :sum, :slice!, :partition, 
 :rpartition, :force_encoding, :b, :valid_encoding?, :ascii_only?, :unpack, :encode, 
 :encode!, :to_r, :to_c]


here are the methods that symbol responds to that string does not:

symbol.methods - string.methods #=>
[:id2name, :to_proc]


Strings: 

:upcase! - will change the original object text to all uppercase letters
puts string.upcase! #=> "HELLO"

:gsub - will create another object that replaces the first argment with 
the second argument in the new string object  
puts string.gsub("E","a") #=> "HaLLO"
puts string #=> "HELLO" - has a different object ID



Symbols:

:id2name - changes the symbol object to a string object
puts symbol.id2name #=> "hello"
puts symbol #=> :hello
puts symbol.id2name.class #=> String

:to_proc - will convert a symbol object to a Proc object which allows you to cache 
a block in a variable object




