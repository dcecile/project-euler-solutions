# frozen_string_literal: true

# Largest product in a series
# https://projecteuler.net/problem=8

# Compute the product incrementally, multiplying by
# new digits and dividing by old digits, keep a stack
# of zeroes separately
class PartialProduct
  def self.solve(input, product_length)
    partial_product = PartialProduct.new(
      parse_input(input),
      product_length
    )
    partial_product.each.max
  end

  def self.parse_input(input)
    # Remove whitespace from start and end
    # Split between every character (and "eat" any
    #   whitespace between characters)
    # Parse each letter as an integer digit
    input.strip.split(/\s*/).map(&:to_i)
  end

  def initialize(all_digits, product_length)
    @current_digits = []
    @next_digits = all_digits
    @product = 1
    @zeroes = 0
    product_length.times { push! }
  end

  def each
    Enumerator.new do |yielder|
      loop do
        yielder << product
        break if last?
        next!
      end
    end
  end

  private

  def product
    if @zeroes.positive?
      0
    else
      @product
    end
  end

  def last?
    @next_digits.none?
  end

  def next!
    pop!
    push!
  end

  def push!
    digit = @next_digits.shift
    if digit.zero?
      @zeroes += 1
    else
      @product *= digit
    end
    @current_digits.push(digit)
  end

  def pop!
    digit = @current_digits.shift
    if digit.zero?
      @zeroes -= 1
    else
      @product /= digit
    end
  end
end
