class Player
    def initialize(id, name, hit_point, attack_damage)
        @id = id
        @name = name
        @hit_point = hit_point
        @attack_damage = attack_damage
    end

    def do_attack(other_user)
        other_user.reduce_point(attack_damage)
    end

    def reduce_point(point)
        @hit_point -= point
    end

    def to_string()
        puts "#{@name} has #{@hit_point} hitpoint and #{@attack_damage} attack damage"
    end
end