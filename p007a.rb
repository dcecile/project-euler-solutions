require "set"

class Sieve
  def self.find_nth_prime(n)
    limit = calculate_nth_prime_limit(n)
    set = SortedSet.new(2..limit)
    (n - 1).times do
      current = set.first
      set.delete(current)
      multiple = current * current
      while multiple < limit
        set.delete(multiple)
        multiple += current
      end
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
end
