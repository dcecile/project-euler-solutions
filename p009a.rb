# Special Pythagorean triplet
# https://projecteuler.net/problem=9

# Build Pythagorean triplets digit-by-digit, trying
# to find one triplet with a matching sum
class Triplet
  def self.find_sum(sum_target)
    # The highest value for `c` will be when `a` is close to zero
    # The lowest value for `c` will be when `a` is close to `c`
    high_c = sum_target / 2
    low_c = sum_target / 3
    high_c
      .downto(low_c)
      .lazy
      .flat_map { |c| find_matches(sum_target, c) }
      .first
  end

  def self.find_matches(sum_target, c)
    find(c**2)
      .select { |a, b| a + b + c == sum_target }
      .map { |a, b| [a, b, c] }
  end

  def self.find(target)
    Triplet.new(0, 0, target, 0).find_parts
  end

  def initialize(a, b, target, next_bit)
    @a = a
    @b = b
    @target = target
    @next_bit = next_bit
    @current_result = @a**2 + @b**2
  end

  def find_parts
    finish || find_all_next_parts
  end

  def finish
    finish_exact || finish_wrong
  end

  def finish_exact
    return nil unless @current_result == @target
    if @a.between?(1, @b - 1)
      # `a` and `b` are non-equal, natural numbers
      # Pythagorean triplet found
      [[@a, @b]]
    else
      # Target reached, but not a Pythagorean triplet
      []
    end
  end

  def finish_wrong
    if @current_result > @target
      # Already completely past target
      []
    elsif @current_result & mask != @target & mask
      # Current digits don't match target
      []
    end
  end

  def find_all_next_parts
    # Add another digit to `a` and `b`
    find_next_parts(0, 0) +
      find_next_parts(0, 1) +
      find_next_parts(1, 0) +
      find_next_parts(1, 1)
  end

  def find_next_parts(increment_a, increment_b)
    next_triplet = Triplet.new(
      @a + (increment_a << @next_bit),
      @b + (increment_b << @next_bit),
      @target,
      @next_bit + 1
    )
    next_triplet.find_parts
  end

  def mask
    # The next bit cannot affect the product/sum
    # of the current bits
    (1 << @next_bit) - 1
  end
end
