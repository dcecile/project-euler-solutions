require "p001a"

RSpec.describe(RangeFilter) do
  describe "::matches_fizz_or_buzz?" do
    test_cases = {
      1 => false,
      2 => false,
      3 => true,
      4 => false,
      5 => true,
      6 => true,
      14 => false,
      15 => true,
      16 => false
    }
    test_cases.each do |input, output|
      it "categorizes #{input}" do
        expect(RangeFilter.matches_fizz_or_buzz?(input)).to be output
      end
    end
  end

  describe "::solve" do
    test_cases = {
      1..1 => 0,
      1..5 => 8,
      1..9 => 23,
      1..10 => 33,
      1..999 => 233_168
    }
    test_cases.each do |input, output|
      it "finds sum for numbers in #{input}" do
        expect(RangeFilter.solve(input)).to eq output
      end
    end
  end
end
