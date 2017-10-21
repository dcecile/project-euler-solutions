# Multiples of 3 and 5
# https://projecteuler.net/problem=1

def calculate_arithmetic_series_sum(from, to, by)
  to -= (to - from) % by
  count = (to - from) / by + 1
  count * (to + from) / 2
end

def calculate_problem_sum(by)
  calculate_arithmetic_series_sum(by, 999, by)
end

puts (calculate_problem_sum(3) +
  calculate_problem_sum(5) -
  calculate_problem_sum(15))
