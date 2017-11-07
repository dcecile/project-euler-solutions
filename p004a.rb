# Largest palindrome product
# https://projecteuler.net/problem=4

# Directly generate all numbers with correct number of digits,
# cross-multiple all, then find the largest palindrome
class Solution
  def self.palindrome?(n)
    text = n.to_s
    text == text.reverse
  end

  def self.generate_source(digits)
    from = digits == 1 ? 0 : 10**(digits - 1)
    to = 10**digits - 1
    (from..to).to_a
  end

  def self.create_products(source)
    source
      .repeated_combination(2)
      .map do |pair|
        pair[0] * pair[1]
      end
  end

  def self.find_solution
    create_products(generate_source(3))
      .select(&method(:palindrome?))
      .sort
      .last
  end
end
