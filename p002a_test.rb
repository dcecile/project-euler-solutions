require "p002a"

RSpec.describe(FibonacciNumber) do
  describe "#next" do
    test_cases = {
      [0, 1] => 1,
      [1, 1] => 2,
      [5, 8] => 13
    }
    test_cases.each do |input, output|
      it "calculates next number for #{input}" do
        expect(FibonacciNumber.new(*input).next.value).to eq output
      end
    end
  end

  describe "::sequence" do
    it "finds first 6" do
      expect(FibonacciNumber.sequence.take(6).to_a).to eq(
        [1, 1, 2, 3, 5, 8]
      )
    end
  end

  describe "::solve" do
    test_cases = {
      1 => 0,
      20 => 2 + 8,
      100 => 2 + 8 + 34,
      4_000_000 => 4_613_732
    }
    test_cases.each do |input, output|
      it "finds for #{input}" do
        expect(FibonacciNumber.solve(input)).to eq output
      end
    end
  end
end
