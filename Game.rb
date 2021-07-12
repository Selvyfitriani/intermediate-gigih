require_relative "Player"

class Game

    def initialize() 
        @players = []
    end

    def add_player(player)
        @players << player
    end

    def players_info()
        @players.each do |player|
            puts player.to_string()
            puts "\n"
        end
    end
    
    def over?
        @players.each {
            |player|
            if player.dead? then
                puts "#{player.name} dies"
                return true
            end
        }
        return false
    end
end