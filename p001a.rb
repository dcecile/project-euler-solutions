# Multiples of 3 and 5
# https://projecteuler.net/problem=1

def matches_fizz_or_buzz?(n)
  three_multiple = n % 3 == 0
  five_multiple = n % 5 == 0
  three_multiple || five_multiple
end

below_one_thousand = 1..999

puts below_one_thousand
  .select(&method(:matches_fizz_or_buzz?))
  .reduce(&:+)
