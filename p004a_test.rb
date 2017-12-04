# frozen_string_literal: true

require "p004a"

RSpec.describe Solution do
  describe "::palindrome?" do
    test_cases = {
      88 => true,
      80 => false,
      8_008 => true,
      3_920 => false,
      2 => true,
      232 => true,
      52_032 => false
    }
    test_cases.each do |input, output|
      it "checks #{input}" do
        expect(Solution.palindrome?(input)).to be output
      end
    end
  end

  describe "::generate_source" do
    test_cases = [
      [1, 0, 9],
      [2, 10, 99],
      [3, 100, 999]
    ]
    test_cases.each do |input, from, to|
      it "has correct length and range for #{input}" do
        expect(Solution.generate_source(input)).to contain_exactly(
          *[a_value_between(from, to)] * (to - from + 1)
        )
      end
    end
  end

  describe "::create_products" do
    test_cases = {
      [1, 2, 3] => [
        1 * 1,
        1 * 2,
        1 * 3,
        2 * 2,
        2 * 3,
        3 * 3
      ],
      [91, 99] => [
        91 * 91,
        91 * 99,
        99 * 99
      ]
    }
    test_cases.each do |input, output|
      it "multiplies all entries" do
        expect(Solution.create_products(input)).to eq(output)
      end
    end
  end

  describe "when finding the solution" do
    it "must output the answer" do
      expect(Solution.find_solution).to eq(906_609)
    end
  end
end
