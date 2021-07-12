require_relative "Player"
require_relative "Game"


player1 = Player.new(1, "Jin Sakai", 100, 50)
player2 = Player.new(2, "Khotun Khan", 500, 50)

game1 = Game.new()
game1.add_player(player1)
game1.add_player(player2)

game1.players_info()

is_over = false

while !is_over
    player1.do_attack(player2)
    player2.do_attack(player1)
   
    is_over = game1.over?
end
