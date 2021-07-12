require_relative "Player"
require_relative "Game"


player1 = Player.new(1, "Jin Sakai", 100, 50)
player2 = Player.new(2, "Khotun Khan", 500, 50)
game1 = Game.new()
game1.add_player(player1)
game1.add_player(player2)

is_over = false

puts player1.to_string()
puts "\n"

puts player2.to_string() 
puts "\n"

while !is_over
    player1.do_attack(player2)
    puts player2.to_string()    
    puts "\n"
    player2.do_attack(player1)
    puts player1.to_string()
    puts "\n"
    is_over = game1.over?
end
