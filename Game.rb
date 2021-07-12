require_relative "Player"

class Game
    def initialize() 
        @player_list = []
    end

    def add_player(player)
        @player_list << player
    end
    
    def over?
        @player_list.each {
            |player|
            if player.dead? then
                puts "#{player.name} dies"
                return true
            end
        }
        return false
    end
end