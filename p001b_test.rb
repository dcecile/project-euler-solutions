require "p001b"

RSpec.describe(ArithmeticSeries) do
  describe "::calculate_sum" do
    test_cases = {
      [0, 3, 1] => 1 + 2 + 3,
      [0, 10, 2] => 2 + 4 + 6 + 8 + 10,
      [9, 14, 3] => 9 + 12
    }
    test_cases.each do |input, output|
      from, to, by = *input
      it "calculates sum from #{from} to #{to} by #{by}" do
        expect(ArithmeticSeries.calculate_sum(from, to, by)).to eq output
      end
    end
  end

  describe "::solve" do
    test_cases = {
      0 => 0,
      5 => 8,
      9 => 23,
      10 => 33,
      999 => 233_168
    }
    test_cases.each do |input, output|
      it "finds sum for numbers up to #{input}" do
        expect(ArithmeticSeries.solve(input)).to eq output
      end
    end
  end
end
