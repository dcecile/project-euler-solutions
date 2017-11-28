# Largest prime factor
# https://projecteuler.net/problem=3

# Use a lazy hash to compute and store results, for a
# dynamic programming approach to finding primes
class Solution
  def initialize
    @largest_prime_factor = Hash.new do |hash, key|
      hash[key] = find_largest_prime_factor(key)
    end
  end

  def find_largest_prime_factor(n)
    return 1 if n == 1
    find_all_factors(n)
      .sort_by(&:-@)
      .find do |factor|
        @largest_prime_factor[factor] == 1
      end
  end

  def find_all_factors(n)
    factor_range = Math.sqrt(n).floor.downto(2)
    small_factors =
      factor_range
      .select { |factor| (n % factor).zero? }
    small_factors
      .map { |factor| [factor, n / factor] }
      .flatten
      .concat([1])
  end
end
