# Sum square difference
# https://projecteuler.net/problem=6

# Evaluating the formula directly is fine to do
# because 100**4 is a small number (no bignum math
# needed), and because the algorithm is O(n)
class DirectSolution
  def self.solve(n)
    sum_of_squares = (1..n)
      .map(&method(:square))
      .reduce(0, &:+)

    square_of_sum = square(
      (1..n).reduce(0, &:+))

    square_of_sum - sum_of_squares
  end

  def self.square(n)
    n**2
  end
end

# Because the squares are subtracted out, we're
# left with the crosswise pairs of all the numbers,
# but this algorithm is O(n**2)
class CombinationsSolution
  def self.solve(n)
    2 * (1..n)
      .to_a
      .combination(2)
      .lazy
      .map { |x, y| x * y }
      .reduce(0, &:+)
  end
end

# To calculate the sum of all crosswise multi-
# plications, progressively factor out each number's
# multiplication with the other numbers, bringing the
# algorithm back to O(n)
class DynamicProgrammingSolution
  def self.solve(n)
    result = 0
    partial_sum = 0
    (1..n).each do |x|
      result += x * partial_sum
      partial_sum += x
    end
    result * 2
  end
end
