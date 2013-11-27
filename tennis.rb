module Tennis
  class Game
    attr_accessor :player1, :player2

    # This sets Player1 and Player2 when a new Game is run
    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end
    
    # This is the actual Tennis Game.  
    def playgame
      counter = 0
      while counter < 20
        # Each Serve of the Ball is random: either a 1 or 2 is returned.  
        # If serve results in a 1, player 1 wins point. Else, player 2 wins point.
        serve = 1 + rand(2)
        if serve == 1 
          player1.record_won_ball!
          puts "Player1 has won the ball."
        else
          player2.record_won_ball!
          puts "Player2 has won the ball."
        end 
        #This reports the current score of the game after each serve.
        puts "The score is: Player1 = #{player1.score} to Player2 = #{player2.score}"
        #This increases the counter by 1. Game keeps playing till it's won.
        counter = counter + 1
        
        #The Case looks at the scores of each player and either continues the game or ends 
        #the game if there is a winner.
        case 
          when player1.points == 0 && player2.points > 4
            puts "Player 2 has won the game!"
            return  #This ends the game and kills the while loop.
          when player2.points == 0 && player1.points > 4
            puts "Player 1 has won the game!"
            return   #This ends the game and kills the while loop.
          when
            player1.points <= 2 && player2.points <= 3
            puts "Keep playing."
          when 
            player1.points <= 3 && player2.points <= 2
            puts "Keep playing."
          when
            player1.points <= 2 && player2.points <= 2
            puts "Keep playing."
          when 
            player1.points == 3 && player2.points <= 2
            puts "Keep playing."
          when
            player1.points == 1 && player2.points <= 2
            puts "Keep playing."
          when
            player1.points == 3 && player2.points == 3 
            puts "Game is in Duece."
          when
            player1.points == 4 && player2.points == 3
            puts "Player 1 has advantage, Keep playing!"
          when
            player1.points == 3 && player2.points == 4
            puts "Player 2 has advantage, Keep playing!"
          when
            player1.points == 4 && player2.points <= 2
            puts "Player 1 has won the game!"
            return #This ends the game and kills the while loop.
          when
            player1.points <= 2 && player2.points == 4
            puts "Player 2 has won the game!"
            return  #This ends the game and kills the while loop.
          when
            player1.points == 5 && player2.points <= 3
            puts "Player 1 has won the ball and the game!"
            return  #This ends the game and kills the while loop.
          when
            player1.points <= 3 && player2.points == 5
            puts "Player 2 has won the ball and the game!"
            return#This ends the game and kills the while loop.
          when 
            player1.points == 4 && player2.points == 4
            puts "This game is getting intense. Keep playing!"
          when 
            player1.points == 4 && player2.points >= 6
            puts "Player 2 has won the ball and the game!"
            return
          when 
            player2.points == 4 && player1.points >= 6
            puts "Player 1 has won the ball and the game!"
            return
          when 
            player1.points > 3 && player1.points > player2.points + 1
            puts ":o) Player 1 has won the ball and the game!"
            return
          when 
            player2.points > 3 && player2.points > player1.points + 1
            puts ":o) Player 2 has won the ball and the game!"
            return

# "player1 wins!" if @points > 3 && @points > @opponent.points + 1
#       return "opponent wins!" if @opponent.points > 3 && @opponent.points > @points + 1

          else  #This is a catch all for any scores I missed, but I think I got them all.
            puts "This is a good game! Keep Playing."
        end 
      #This line is used to break up each Serve of the Ball, in the game, so it's easy to 
      # read the current game results.
      puts "-------------------------------------------------------------------------"
      end
    end 


    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing
    # the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer 
      #instead of a player object?
      # Then reimplement this method!

      winner.record_won_ball!
    end
  end



  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
      @opponent = opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end
    
    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return 'advantage' if @points == 4
      return 'adv +' if @points >= 5
    end
  end
end

Tennis::Game.new.playgame