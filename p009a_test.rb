# frozen_string_literal: true

require "p009a"

RSpec.describe Triplet do
  describe "#find_parts" do
    test_cases = [
      [1, 2, 5, 2, [[1, 2]]],
      [1, 0, 5, 2, []],
      [3, 0, 5, 2, []],
      [3, 2, 5, 2, []],
      [1, 0, 5, 1, [[1, 2]]],
      [0, 0, 5, 1, []],
      [0, 1, 5, 1, []],
      [1, 1, 5, 1, []],
      [0, 0, 5, 0, [[1, 2]]],
      [0, 0, 0, 0, []],
      [0, 0, 1, 0, []],
      [0, 0, 2, 0, []],
      [0, 0, 3, 0, []],
      [0, 0, 4, 0, []],
      [
        0b0_1100_1000,
        0b1_0111_0111,
        0b10_1100_0001_1001_0001,
        9,
        [[200, 375]]
      ],
      [
        0b0_1100_1000,
        0b0_0111_0111,
        0b10_1100_0001_1001_0001,
        8,
        [[200, 375]]
      ]
    ]
    test_cases.each do |a, b, target, next_bit, solution|
      it "finding #{target} from bit #{next_bit} and #{[a, b]}" do
        expect(Triplet.new(a, b, target, next_bit).find_parts).to eq(
          solution
        )
      end
    end
  end

  describe "::find" do
    test_cases = [
      [5**2, [[3, 4]]],
      [1000, [[18, 26], [10, 30]]],
      [
        425**2,
        [
          [180, 385],
          [200, 375],
          [297, 304],
          [65, 420],
          [87, 416],
          [119, 408],
          [255, 340]
        ]
      ]
    ]
    test_cases.each do |target, solution|
      it "finding #{target}" do
        expect(Triplet.find(target)).to eq(
          solution
        )
      end
    end
  end

  describe "::find_sum" do
    test_cases = [
      [12, [3, 4, 5]],
      [1000, [200, 375, 425]]
    ]
    test_cases.each do |target, solution|
      it "finding #{target}" do
        expect(Triplet.find_sum(target)).to eq(
          solution
        )
      end
    end
  end
end
