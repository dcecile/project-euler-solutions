# frozen_string_literal: true

# Even Fibonacci numbers
# https://projecteuler.net/problem=2

# Store history in each number to calculate the next, and
# generate a lazy stream of numbers to pick from
class FibonacciNumber
  attr_reader :value

  def initialize(previous_value, value)
    @previous_value = previous_value
    @value = value
  end

  def next
    FibonacciNumber.new(
      @value,
      @previous_value + @value
    )
  end

  def to_s
    "FibonacciNumber(#{@value})"
  end

  SEED = new(0, 1)

  def self.sequence
    enumerator = Enumerator.new do |enum|
      current = SEED
      loop do
        enum.yield current
        current = current.next
      end
    end
    enumerator
      .lazy
      .map(&:value)
  end

  def self.solve(limit)
    sequence
      .take_while { |n| n <= limit }
      .select(&:even?)
      .reduce(0, &:+)
  end
end
