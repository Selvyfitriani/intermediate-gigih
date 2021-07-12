class Player
    attr_accessor :name

    def initialize(id, name, hit_point, attack_damage)
        @id = id
        @name = name
        @hit_point = hit_point
        @attack_damage = attack_damage
    end

    def do_attack(other_user)
        other_user.reduce_point(@attack_damage)
        puts "#{@name} attacks #{other_user.name} with #{@attack_damage} damage"
    end

    def reduce_point(point)
        @hit_point -= point
    end

    def dead? 
        return @hit_point <= 0
    end

    def to_string()
        return "#{@name} has #{@hit_point} hitpoint and #{@attack_damage} attack damage"
    end
end