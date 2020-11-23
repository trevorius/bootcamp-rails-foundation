require 'elevator_media_display/string_calculator'

describe StringCalculator do
    describe ".add"do
        context 'given an empty string' do 
            it 'returns zero' do
                expect(StringCalculator.add("")).to eq(0)
            end
        end
        context 'test for a string' do
            it 'returns 4' do
                expect(StringCalculator.add("1234")).to eq(4)
            end
        end
    end
end