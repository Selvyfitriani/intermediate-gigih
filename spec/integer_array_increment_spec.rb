require "./test_helper.rb"
require "./app/integer_array_incrementer.rb"

RSpec.describe IntegerArrayIncrementer do
    context '#increment' do
        before(:each) do 
            @incrementer = IntegerArrayIncrementer.new
        end

        it 'should return [1] when input is [0]' do
            input = [0]
            expected_output = [1]

            actual_output = @incrementer.increment(input)
            expect(actual_output).to eq(expected_output)
        end

        it 'should return [2] when input is [1]' do
            input = [1]
            expected_output = [2]

            actual_output = @incrementer.increment(input)
            expect(actual_output).to eq(expected_output)
        end

        it 'should return [1, 0] when input is [9]' do
            input = [9]
            expected_output = [1, 0]

            actual_output = @incrementer.increment(input)
            expect(actual_output).to eq(expected_output)
        end

        it 'should return [1, 1] when input is [1,0]' do
            input = [1, 0]
            expected_output = [1, 1]

            actual_output = @incrementer.increment(input)
            expect(actual_output).to eq(expected_output)
        end
    end
end