# frozen_string_literal: true

require "p003a"

RSpec.describe(Solution) do
  before do
    @solution = Solution.new
  end

  describe "#find_all_factors" do
    test_cases = {
      1 => [1],
      2 => [1],
      3 => [1],
      4 => [2, 2, 1],
      20 => [4, 5, 2, 10, 1]
    }
    test_cases.each do |input, output|
      it "finds for #{input}" do
        expect(@solution.find_all_factors(input)).to eq output
      end
    end
  end

  describe "#find_largest_prime_factor" do
    test_cases = {
      1 => 1,
      2 => 1,
      3 => 1,
      4 => 2,
      20 => 5,
      2**20 => 2,
      600_851_475_143 => 6_857
    }
    test_cases.each do |input, output|
      it "finds for #{input}" do
        expect(@solution.find_largest_prime_factor(input)).to eq output
      end
    end
  end
end
