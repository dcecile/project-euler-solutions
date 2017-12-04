# frozen_string_literal: true

# Smallest multiple
# https://projecteuler.net/problem=5

Factorization = Struct.new(:value, :parent_factor) do
  def self.new_prime(n)
    parent_factor = nil
    new(n, parent_factor)
  end

  def prime?
    parent_factor.nil?
  end
end

def solve(to)
  find_common_factors(build_factorizations(to))
    .map { |prime, count| prime**count }
    .reduce(1, &:*)
end

def build_factorizations(to)
  primes = []
  factorizations = [nil, nil]
  (2..to).each do |n|
    factorization = factorize(primes, factorizations, n)
    factorizations << factorization
    primes << factorization.value if factorization.prime?
  end
  factorizations.drop(2)
end

def factorize(preceding_primes, preceding_factorizations, n)
  limit = Math.sqrt(n).floor
  prime_factor = find_prime_factor(preceding_primes, limit, n)
  if prime_factor.nil?
    Factorization.new_prime(n)
  else
    remaining_factorization = preceding_factorizations[n / prime_factor]
    Factorization.new(prime_factor, remaining_factorization)
  end
end

def find_prime_factor(preceding_primes, limit, n)
  preceding_primes
    .lazy
    .take_while { |prime| prime <= limit }
    .find { |prime| (n % prime).zero? }
end

def find_common_factors(factorizations)
  primes = factorizations.select(&:prime?).map(&:value)
  common_factors = {}
  primes.each do |prime|
    factorizations = add_common_factors(common_factors, prime, factorizations)
  end
  common_factors
end

def add_common_factors(common_factors, prime, current_factorizations)
  next_factorizations = []
  max_count = 0
  current_factorizations.each do |factorization|
    factorization, count = count_factors(factorization, prime)
    max_count = [max_count, count].max
    next_factorizations << factorization unless factorization.nil?
  end
  common_factors[prime] = max_count
  next_factorizations
end

def count_factors(factorization, prime)
  count = 0
  while !factorization.nil? && factorization.value == prime
    count += 1
    factorization = factorization.parent_factor
  end
  [factorization, count]
end
