# Largest palindrome product
# https://projecteuler.net/problem=4

require "minitest/autorun"

class Solution
  def is_palindrome?(n)
    text = n.to_s
    text == text.reverse
  end

  def generate_source(digits)
    from = digits == 1 ? 0 : 10**(digits - 1)
    to = 10**digits - 1
    (from..to).to_a
  end

  def create_products(source)
    source.repeated_combination(2)
      .map do |pair|
        pair[0] * pair[1]
      end
  end

  def find_solution()
    create_products(generate_source(3))
      .select(&method(:is_palindrome?))
      .sort
      .last
  end
end

describe Solution do
  before do
    @solution = Solution.new
  end

  describe "when checking for palidromes" do
    it "must work with even lengths" do
      @solution.is_palindrome?(88).must_equal true
      @solution.is_palindrome?(80).must_equal false
      @solution.is_palindrome?(8008).must_equal true
      @solution.is_palindrome?(3920).must_equal false
    end
    it "must work with odd lengths" do
      @solution.is_palindrome?(2).must_equal true
      @solution.is_palindrome?(232).must_equal true
      @solution.is_palindrome?(52032).must_equal false
    end
  end

  describe "when creating source input" do
    it "must be in range" do
      @solution.generate_source(1).each do |source|
        source.must_be :>=, 0
        source.must_be :<=, 9
      end
      @solution.generate_source(2).each do |source|
        source.must_be :>=, 10
        source.must_be :<=, 99
      end
    end
    it "must be correct length" do
      @solution.generate_source(1).length.must_equal 10
      @solution.generate_source(2).length.must_equal 90
    end
  end

  describe "when creating products" do
    it "must contain all entries" do
      @solution.create_products([1, 2, 3]).must_equal [
        1 * 1,
        1 * 2,
        1 * 3,
        2 * 2,
        2 * 3,
        3 * 3,
      ]
      @solution.create_products([91, 99]).must_equal [
        91 * 91,
        91 * 99,
        99 * 99,
      ]
    end
  end

  describe "when finding the solution" do
    it "must output the answer" do
      puts @solution.find_solution
    end
  end
end
