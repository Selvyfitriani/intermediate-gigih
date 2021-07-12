require_relative "Player"

player1 = Player.new(1, "Jin Sakai", 100, 50)
player1.to_string()
player1.reduce_point(100)
player1.to_string()