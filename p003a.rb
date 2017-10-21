# Largest prime factor
# https://projecteuler.net/problem=3

def find_largest_prime_factor(n)
  puts "Evaluating #{n}"
  return 1 if n == 1
  largest_factor = Math.sqrt(n).floor
  largest_factor.downto(1)
    .lazy
    .select do |factor|
       n % factor == 0
    end
    .find do |factor|
       @largest_prime_factor[factor] == 1
    end
end

@largest_prime_factor = Hash.new do |hash, key|
  hash[key] = find_largest_prime_factor(key)
end

puts find_largest_prime_factor(600851475143)
