class IntegerArrayIncrementer
    def increment(input)
        output = []

        incrementer_num = 1
        max_each_num = 9
        
        carry = 0
        input_reverse = input.reverse()
        input_reverse.each_with_index do |num, index|
            incremented = num
            if index == 0 
                incremented += incrementer_num
            else 
                incremented += carry
            end

            carry = 0
            if incremented <= max_each_num
                output[index] = incremented
            else 
                output[index] = incremented - max_each_num - incrementer_num
                carry = incremented % max_each_num 
            end
        end

        # handle last carry
        if carry > 0
            output << carry
        end

        return output.reverse()
    end
end