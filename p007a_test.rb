require "p007a"

RSpec.describe Sieve do
  test_cases = {
    1 => 2,
    2 => 3,
    6 => 13,
    7 => 17,
    168 => 997,
    10_001 => 104_743,
  }

  describe "::calculate_nth_prime_limit" do
    test_cases.each do |n, prime|
      if n >= 6
        limit = Sieve.calculate_nth_prime_limit(n)
        it "isn't too far off for #{n} (#{prime} vs. #{"%0.2f" % limit})" do
          # By including Thorem (3.10), we have a lower bound for the n-th
          # prime as well, so if the prime falls between lower and upper
          # bounds, then the bounds are correct (not too narrow, not too wide)
          expect(limit - prime).to be < n
        end
      else
        it "is fixed for for #{n}" do
          expect(Sieve.calculate_nth_prime_limit(n)).to eq(8)
        end
      end
    end
  end

  describe "::find_nth_prime" do
    test_cases.each do |n, prime|
      it "solves #{n}" do
        expect(Sieve.find_nth_prime(n)).to eq(prime)
      end
    end
  end
end
