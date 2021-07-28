class IntegerArrayIncrementer
    def increment(input)
        output = []
        incremented = input[-1] + 1
        if input.length == 1
            if input[0] < 9
                output << input[0] + 1
            else
                output = [1, 0]
            end
        else 
            output = input
            output[-1] = incremented
        end
        return output
    end
end