require "p005b"

RSpec.describe Factorization do
  factors = [nil, nil]
  factors << Factorization.make_prime(2)
  factors << Factorization.make_prime(3)
  factors << Factorization.new(2, factors[2])
  factors << Factorization.make_prime(5)
  factors << Factorization.new(2, factors[3])
  factors << Factorization.make_prime(7)
  factors << Factorization.new(2, factors[4])

  describe "::factorize" do
    (2..8).each do |n|
      it "factors #{n}" do
        preceding_factorizations = factors.take(n - 1)
        preceding_primes = preceding_factorizations
          .drop(2)
          .select(&:prime?)
          .map(&:value)
        expect(
          Factorization.factorize(
            preceding_primes,
            preceding_factorizations,
            n)).to eq(factors[n])
      end
    end
  end

  describe "::build_factorizations" do
    (2..8).each do |n|
      it "builds to #{n}" do
        expect(
          Factorization.build_factorizations(
            n)).to eq(factors.take(n + 1).drop(2))
      end
    end
  end

  describe "::find_common_factors" do
    test_cases = {
      factors[2..2] => { 2 => 1 },
      factors[2..3] => { 2 => 1, 3 => 1 },
      factors[2..4] => { 2 => 2, 3 => 1 },
      factors[2..8] => { 2 => 3, 3 => 1, 5 => 1, 7 => 1 },
    }
    test_cases.each do |input, output|
      it "finds to #{input.length + 1}" do
        expect(
          Factorization.find_common_factors(input)).to eq(output)
      end
    end
  end

  describe "::solve" do
    test_cases = {
      2 => 2,
      3 => 6,
      6 => 60,
      10 => 2520,
      20 => 232792560,
    }
    test_cases.each do |input, output|
      it "solves to #{input}" do
        expect(
          Factorization.solve(input)).to eq(output)
      end
    end
  end
end
