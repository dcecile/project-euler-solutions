# frozen_string_literal: true

# Multiples of 3 and 5
# https://projecteuler.net/problem=1

# Apply the fizz-buzz test to all numbers in a given range
# and add up the sum
module RangeFilter
  def self.matches_fizz_or_buzz?(n)
    three_multiple = (n % 3).zero?
    five_multiple = (n % 5).zero?
    three_multiple || five_multiple
  end

  def self.solve(range)
    range
      .select(&method(:matches_fizz_or_buzz?))
      .reduce(0, &:+)
  end
end
