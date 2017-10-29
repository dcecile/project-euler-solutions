Triplet = Struct.new(:a, :b, :target, :next_bit) do
  def self.find_sum(sum_target)
    # The highest value for `c` will be when `a` is close to zero
    # The lowest value for `c` will be when `a` is close to `c`
    high_c = sum_target/2
    low_c = sum_target/3
    (high_c).downto(low_c)
      .map do |c|
        find(c**2)
          .select do |a, b|
            a + b + c == sum_target
          end
          .map do |a, b|
            [a, b, c]
          end
      end
      .flatten(1)
      .first
  end

  def self.find(target)
    Triplet.new(0, 0, target, 0).find_parts
  end

  def find_parts
    current_result = a**2 + b**2
    if current_result == target
      if 0 < a && a < b
        # `a` and `b` are non-equal, natural numbers
        # Pythagorean triplet found
        [[a, b]]
      else
        # Target reached, but not a Pythagorean triplet
        []
      end
    elsif current_result > target
      # Already completely past target
      []
    elsif current_result & mask != target & mask
      # Current digits don't match target
      []
    else
      # Add another digit to `a` and `b`
      find_next_parts(0, 0) +
        find_next_parts(0, 1) +
        find_next_parts(1, 0) +
        find_next_parts(1, 1)
    end
  end

  def find_next_parts(increment_a, increment_b)
    Triplet.new(
      a + (increment_a << next_bit),
      b + (increment_b << next_bit),
      target,
      next_bit + 1).find_parts
  end

  def mask
    # The next bit cannot affect the product/sum
    # of the current bits
    (1 << next_bit) - 1
  end
end
