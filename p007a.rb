# frozen_string_literal: true

# 10001st prime
# https://projecteuler.net/problem=7

require "set"

# Use a sorted set as a Sieve of Eratosthenes, to
# get easy access to the next prime and cull non-prime
# numbers -- combined with an upper bound for the
# n-th prime
class Sieve
  def self.find_nth_prime(n)
    limit = calculate_nth_prime_limit(n)
    set = SortedSet.new(2..limit)
    (n - 1).times do
      remove_multiples(limit, set, set.first)
    end
    set.first
  end

  def self.calculate_nth_prime_limit(n)
    if n >= 6
      # From:
      #   Rosser, J. Barkley; Schoenfeld, Lowell.
      #   Approximate formulas for some functions of prime numbers.
      #   Illinois J. Math. 6 (1962), no. 1, 64--94.
      #   https://projecteuclid.org/euclid.ijm/1255631807
      # Corollary (3.13) gives a simple upper bound on the n-th prime
      n * (Math.log(n) + Math.log(Math.log(n)))
    else
      8
    end
  end

  def self.remove_multiples(limit, set, prime)
    set.delete(prime)
    multiple = prime * prime
    while multiple < limit
      set.delete(multiple)
      multiple += prime
    end
  end
end
