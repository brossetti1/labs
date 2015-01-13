3rd RuboCop - 1 file inspected, 5 offenses detected
#all these errors are part of the program

warning: parser/current is loading parser/ruby21, which recognizes
warning: 2.1.5-compliant syntax, but you are running 2.1.3.
Inspecting 1 file


Offenses:

hangman.rb:7:81: C: Line is too long. [81/80]
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
                                                                                ^
hangman.rb:11:76: C: Trailing whitespace detected.
#  Brit constructed the first bit of hangman and we had to finish the game.
                                                                           ^
hangman.rb:28:1: C: Method has too many lines. [12/10]
def hangman(words)
^^^
hangman.rb:32:46: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
  player_answer = answer.gsub(/[[:alpha:]]/, "-")
                                             ^^^
hangman.rb:36:5: C: Favor modifier unless usage when having a single-line body. Another good alternative is the usage of control flow &&/||.
    unless answer.include?(guess)
    ^^^^^^

1 file inspected, 5 offenses detected



_______________________________________________________________________________________________________________________________



2nd RuboCop  - 
1 file inspected, 15 offenses detected

Offenses:

hangman.rb:7:81: C: Line is too long. [81/80]
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
                                                                                ^
hangman.rb:11:76: C: Trailing whitespace detected.
#  Brit constructed the first bit of hangman and we had to finish the game.
                                                                           ^
hangman.rb:28:1: C: Assignment Branch Condition size for hangman is too high. [15.07/15]
def hangman(words)
^^^
hangman.rb:28:1: C: Method has too many lines. [13/10]
def hangman(words)
^^^
hangman.rb:33:46: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
  player_answer = answer.gsub(/[[:alpha:]]/, "-")
                                             ^^^
hangman.rb:37:5: C: Favor modifier unless usage when having a single-line body. Another good alternative is the usage of control flow &&/||.
    unless answer.include?(guess)
    ^^^^^^
hangman.rb:51:14: C: Do not put a space between a method name and the opening parenthesis.
def finished? (turns, guesses, answer)
             ^
hangman.rb:55:14: W: Unused method argument - attempts. If it's necessary, use _ or _attempts as an argument name to indicate that it won't be used. You can also write as greeting(*) if you want the method to accept any arguments but don't care about them.
def greeting(attempts)
             ^^^^^^^^
hangman.rb:61:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "you won, high five"
      ^^^^^^^^^^^^^^^^^^^^
hangman.rb:63:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "you lose"
      ^^^^^^^^^^
hangman.rb:69:34: C: Space between { and | missing.
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                 ^^
hangman.rb:69:81: C: Line is too long. [98/80]
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                                                                ^^^^^^^^^^^^^^^^^^
hangman.rb:69:98: C: Space missing inside }.
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                                                                                 ^
hangman.rb:80:55: C: Trailing whitespace detected.
  if /[[:alpha:]]/ =~ input && input.chomp.length == 1
                                                      ^
hangman.rb:83:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "we need a letter."
      ^^^^^^^^^^^^^^^^^^^

1 file inspected, 15 offenses detected


_______________________________________________________________________________________________________________________________

1st RuboCop - 1 file inspected, 36 offenses detected


warning: parser/current is loading parser/ruby21, which recognizes
warning: 2.1.5-compliant syntax, but you are running 2.1.3.
Inspecting 1 file

Offenses:

hangman.rb:8:81: C: Line is too long. [81/80]
#  Compiler:      ruby 2.1.3 p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
                                                                                ^
hangman.rb:12:76: C: Trailing whitespace detected.
#  Brit constructed the first bit of hangman and we had to finish the game.
                                                                           ^
hangman.rb:17:1: C: Extra blank line detected.
hangman.rb:21:9: C: Use %w or %W for array of words.
words = ['angus',
        ^^^^^^^^^
hangman.rb:33:1: C: Extra blank line detected.
hangman.rb:34:1: C: Extra blank line detected.
hangman.rb:35:1: C: Assignment Branch Condition size for hangman is too high. [15.07/15]
def hangman(words)
^^^
hangman.rb:35:1: C: Method has too many lines. [13/10]
def hangman(words)
^^^
hangman.rb:40:46: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
  player_answer = answer.gsub(/[[:alpha:]]/, "-")
                                             ^^^
hangman.rb:44:5: C: Favor modifier unless usage when having a single-line body. Another good alternative is the usage of control flow &&/||.
    unless answer.include?(guess)
    ^^^^^^
hangman.rb:51:1: C: Extra blank line detected.
hangman.rb:52:1: C: Extra blank line detected.
hangman.rb:60:1: C: Extra blank line detected.
hangman.rb:61:1: C: Extra blank line detected.
hangman.rb:62:14: C: Do not put a space between a method name and the opening parenthesis.
def finished? (turns, guesses, answer)
             ^
hangman.rb:66:1: C: Extra blank line detected.
hangman.rb:67:1: C: Extra blank line detected.
hangman.rb:68:14: W: Unused method argument - attempts. If it's necessary, use _ or _attempts as an argument name to indicate that it won't be used. You can also write as greeting(*) if you want the method to accept any arguments but don't care about them.
def greeting(attempts)
             ^^^^^^^^
hangman.rb:72:1: C: Extra blank line detected.
hangman.rb:73:1: C: Extra blank line detected.
hangman.rb:76:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "you won, high five"
      ^^^^^^^^^^^^^^^^^^^^
hangman.rb:78:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "you lose"
      ^^^^^^^^^^
hangman.rb:82:1: C: Extra blank line detected.
hangman.rb:83:1: C: Extra blank line detected.
hangman.rb:86:34: C: Space between { and | missing.
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                 ^^
hangman.rb:86:81: C: Line is too long. [98/80]
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                                                                ^^^^^^^^^^^^^^^^^^
hangman.rb:86:98: C: Space missing inside }.
    answer.chars.each_with_index {|letter, i| player_answer[i] = letter if letter == player_guess}
                                                                                                 ^
hangman.rb:92:1: C: Extra blank line detected.
hangman.rb:93:1: C: Extra blank line detected.
hangman.rb:98:1: C: Extra blank line detected.
hangman.rb:99:1: C: Extra blank line detected.
hangman.rb:101:55: C: Trailing whitespace detected.
  if /[[:alpha:]]/ =~ input && input.chomp.length == 1
                                                      ^
hangman.rb:104:7: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    p "we need a letter."
      ^^^^^^^^^^^^^^^^^^^
hangman.rb:109:1: C: Extra blank line detected.
hangman.rb:110:1: C: Extra blank line detected.
hangman.rb:111:1: C: Extra blank line detected.

1 file inspected, 36 offenses detected