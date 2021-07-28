class IntegerArrayIncrementer
    def increment(input)
        output = []
        if input.length == 1
            if input[0] < 9
                output << input[0] + 1
            else
                output << 1
                output << 0
            end
        end
        return output
    end
end