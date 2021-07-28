class IntegerArrayIncrementer
    def increment(input)
        output = input
        incremented = input[-1] + 1
        if input.length == 1
            if incremented <= 9
                output[-1] = incremented
            else
                output = [1, 0]
            end
        else 
            if incremented <= 9
                output[-1] = incremented
            else 
                output[-1] = 0
                output[0] += 1
            end
        end
        return output
    end
end