# Smallest multiple
# https://projecteuler.net/problem=5

class Factors
  attr_reader :primes

  def self.find_smallest_multiple(to)
    find_common_factors(to)
      .primes
      .map do |prime, count|
        prime**count
      end
      .reduce(1, &:*)
  end

  def self.find_common_factors(to)
    common_factors = Factors.new
    (2..to).each do |n|
      common_factors << common_factors.factorize(n)
    end
    common_factors
  end

  def initialize(primes = Hash.new(0))
    @primes = primes
  end

  def <<(input)
    if input.is_a?(Fixnum)
      @primes[input] += 1
    else
      input.primes.each do |prime, count|
        primes[prime] = [primes[prime], count].max
      end
    end
  end

  def product
    @primes
      .map { |prime, count| prime**count }
      .reduce(1, &:*)
  end

  def factorize(n)
    factors = Factors.new
    loop do
      factor = @primes.keys
        .find { |prime| n % prime == 0 }
      if factor != nil && factor != n
        factors << factor
        n /= factor
      else
        factors << n
        break
      end
    end
    factors
  end
end
