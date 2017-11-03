require "p005a"

RSpec.describe Factors do
  before { @factors = Factors.new }

  context "when empty" do
    it "has no primes" do
      expect(@factors.primes).to eq({})
    end

    it "has a product of 1" do
      expect(@factors.product).to eq(1)
    end
  end

  context "when has a 2" do
    before { @factors << 2 }

    it "has a product of 2" do
      expect(@factors.product).to eq(2)
    end
  end

  context "when has three 2s" do
    before do
      @factors << 2
      @factors << 2
      @factors << 2
    end

    it "has a product of 8" do
      expect(@factors.product).to eq(8)
    end
  end

  context "when has two 2s and a 3" do
    before do
      @factors << 2
      @factors << 2
      @factors << 3
    end

    it "has a product of 12" do
      expect(@factors.product).to eq(12)
    end
  end

  context "when (2**1, 3**2) is combined with (3**1, 5**2)" do
    before do
      @factors << 2
      @factors << 3
      @factors << 3
      other_factors = Factors.new
      other_factors << 3
      other_factors << 5
      other_factors << 5
      @factors << other_factors
    end

    it "has a product of (2**1 * 3**2 * 5**2)" do
      expect(@factors.product).to eq(2**1 * 3**2 * 5**2)
    end
  end

  describe "#factorize" do
    context "starting with 2 and 3" do
      before do
        @factors << 2
        @factors << 3
      end

      test_cases = {
        2 => {
          2 => 1
        },
        4 => {
          2 => 2
        },
        6 => {
          2 => 1,
          3 => 1
        }
      }

      test_cases.each do |input, output|
        it "solves #{input}" do
          expect(@factors.factorize(input).primes).to eq(output)
        end
      end
    end
  end

  describe "::find_common_factors" do
    test_cases = {
      6 => {
        2 => 2,
        3 => 1,
        5 => 1
      },
      10 => {
        2 => 3,
        3 => 2,
        5 => 1,
        7 => 1
      }
    }
    test_cases.each do |input, output|
      it "solves up to #{input}" do
        expect(Factors.find_common_factors(input).primes).to eq(output)
      end
    end
  end

  describe "::find_smallest_multiple" do
    test_cases = {
      6 => 60,
      10 => 2_520,
      20 => 232_792_560
    }
    test_cases.each do |input, output|
      it "solves up to #{input}" do
        expect(Factors.find_smallest_multiple(input)).to eq(output)
      end
    end
  end
end
