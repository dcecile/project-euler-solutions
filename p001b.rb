# Multiples of 3 and 5
# https://projecteuler.net/problem=1

# Instead of looping, calculate the sum of arithemetic series
# to find the answer (avoiding double-counting the common factor)
module ArithmeticSeries
  def self.calculate_sum(from, to, by)
    to -= (to - from) % by
    count = (to - from) / by + 1
    count * (to + from) / 2
  end

  def self.solve(to)
    from = 0
    calculate_sum(from, to, 3) +
      calculate_sum(from, to, 5) -
      calculate_sum(from, to, 15)
  end
end
