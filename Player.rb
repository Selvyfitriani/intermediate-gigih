class Player
    def initialize(id, name, hit_point, attack_damage)
        @id = id
        @name = name
        @hit_point = hit_point
        @attack_damage = attack_damage
    end

    def to_string()
        puts "#{@name} has #{@hit_point} hitpoint and #{@attack_damage} attack damage"
    end
end