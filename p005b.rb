Factorization = Struct.new(:value, :parent_factor) do
  def self.solve(to)
    find_common_factors(build_factorizations(to))
      .map { |prime, count| prime**count }
      .reduce(1, &:*)
  end

  def self.factorize(preceding_primes, preceding_factorizations, n)
    limit = Math.sqrt(n).floor
    prime_factor = preceding_primes
      .lazy
      .take_while { |prime| prime <= limit }
      .find { |prime| n % prime == 0 }
    if prime_factor == nil
      make_prime(n)
    else
      Factorization.new(
        prime_factor,
        preceding_factorizations[n / prime_factor])
    end
  end

  def self.build_factorizations(to)
    primes = []
    factorizations = [nil, nil]
    (2..to).each do |n|
      factorization = factorize(primes, factorizations, n)
      factorizations << factorization
      if factorization.prime?
        primes << factorization.value
      end
    end
    factorizations.drop(2)
  end

  def self.find_common_factors(factorizations)
    primes = factorizations
      .select(&:prime?)
      .map(&:value)
    common_factors = {}
    current_factorizations = factorizations
    next_factorizations = []
    primes.each do |prime|
      max_count = 0
      current_factorizations.each do |factorization|
        count = 0
        while factorization != nil and factorization.value == prime
          count += 1
          factorization = factorization.parent_factor
        end
        max_count = [max_count, count].max
        if factorization != nil
          next_factorizations << factorization
        end
      end
      common_factors[prime] = max_count
      current_factorizations = next_factorizations
      next_factorizations = []
    end
    common_factors
  end

  def self.make_prime(n)
    Factorization.new(value=n, parent_factor=nil)
  end

  def prime?
    parent_factor == nil
  end
end
