require 'pry'

module GameArt
    def game_title
     puts `clear`
     puts "
    
                                               ______   __     ______     ______   ______     ______     ______   ______     ______    
                                              /\\__  _\\ /\\ \\   /\\  ___\\   /\\__  _\\ /\\  __ \\   /\\  ___\\   /\\__  _\\ /\\  __ \\   /\\  ___\\   
                                              \\/_/\\ \\/ \\ \\ \\  \\ \\ \\____  \\/_/\\ \\/ \\ \\  __ \\  \\ \\ \\____  \\/_/\\ \\/ \\ \\ \\/\\ \\  \\ \\  __\\   
                                                 \\ \\_\\  \\ \\_\\  \\ \\_____\\    \\ \\_\\  \\ \\_\\ \\_\\  \\ \\_____\\    \\ \\_\\  \\ \\_____\\  \\ \\_____\\ 
                                                  \\/_/   \\/_/   \\/_____/     \\/_/   \\/_/\\/_/   \\/_____/     \\/_/   \\/_____/   \\/_____/ 
                                                                                                                                      
    
                            ####################################################################################################################################
                         #########################################################################################################################################
                       #############################################################################################################################################
                     #################################################################################################################################################
                 #########################################################################################################################################################
    
    
    
     " 
    end
    
    def show_board(board)                                                                          #0123456789 | |#012345678|9|10 #012345678910                                                                                                
                                              
                    [["                                                                                  _            _             "], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                            #{board[0]}    | |     #{board[1]}    | |     #{board[2]}"], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                      ___________| |__________| |___________ "],     
                     ["                                                                     |___________   __________   ___________|"],    
                     ["                                                                                 | |          | |            "],   
                     ["                                                                                 | |          | |            "],    
                     ["                                                                           #{board[3]}     | |     #{board[4]}    | |     #{board[5]}"], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                      ___________| |__________| |___________ "],  
                     ["                                                                     |___________   __________   ___________|"], 
                     ["                                                                                 | |          | |            "],  
                     ["                                                                                 | |          | |            "], 
                     ["                                                                           #{board[6]}     | |     #{board[7]}    | |     #{board[8]}"],
                     ["                                                                                 | |          | |            "], 
                     ["                                                                                 | |          | |            "], 
                     ["                                                                                 |_|          |_|            "]]  
    end

end
    