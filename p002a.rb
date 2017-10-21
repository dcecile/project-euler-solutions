# Even Fibonacci numbers
# https://projecteuler.net/problem=2

class FibonacciNumber
  attr_reader :value

  def initialize(previous_value, value)
    @previous_value = previous_value
    @value = value
  end

  def next
    FibonacciNumber.new(
      @value,
      @previous_value + @value)
  end

  def to_s
    "FibonacciNumber(#{@value})"
  end
end

fibonacci_seed = FibonacciNumber.new(0, 1)
fibonacci_sequence = Enumerator.new do |enum|
  current = fibonacci_seed
  loop do
    enum.yield current
    current = current.next
  end
end

puts fibonacci_sequence
  .lazy
  .map(&:value)
  .take_while { |n| n <= 4_000_000 }
  .select { |n| n % 2 == 0 }
  .reduce(&:+)
