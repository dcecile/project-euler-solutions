require "p008a"

RSpec.describe PartialProduct do
  describe "#each" do
    test_cases = [
      [[2, 3, 4, 5], 1, [2, 3, 4, 5]],
      [[2, 3, 4, 5], 2, [6, 12, 20]],
      [[2, 3, 4, 5], 3, [24, 60]],
      [[2, 0, 4, 5], 2, [0, 0, 20]],
      [[0, 2, 0, 3, 4], 2, [0, 0, 0, 12]],
      [[0, 0, 2, 3, 0, 4, 5], 2, [0, 0, 6, 0, 0, 20]],
    ]
    test_cases.each do |all_digits, product_length, expected_products|
      it "finds #{product_length}-length products from #{all_digits}" do
        partial_product = PartialProduct.new(
          all_digits, product_length)
        expect(partial_product.each.to_a).to eq(expected_products)
      end
    end
  end

  describe "::parse_input" do
    it "parses small input" do
      expect(PartialProduct.parse_input("1")).to eq(
        [1])
    end

    it "parses big input" do
      expect(PartialProduct.parse_input("12345")).to eq(
        [1, 2, 3, 4, 5])
    end

    it "parses multiline input" do
      input = <<-INPUT
        123
        456
      INPUT
      expect(PartialProduct.parse_input(input)).to eq(
        [1, 2, 3, 4, 5, 6])
    end
  end

  describe "::solve" do
    official_input = <<-INPUT
      73167176531330624919225119674426574742355349194934
      96983520312774506326239578318016984801869478851843
      85861560789112949495459501737958331952853208805511
      12540698747158523863050715693290963295227443043557
      66896648950445244523161731856403098711121722383113
      62229893423380308135336276614282806444486645238749
      30358907296290491560440772390713810515859307960866
      70172427121883998797908792274921901699720888093776
      65727333001053367881220235421809751254540594752243
      52584907711670556013604839586446706324415722155397
      53697817977846174064955149290862569321978468622482
      83972241375657056057490261407972968652414535100474
      82166370484403199890008895243450658541227588666881
      16427171479924442928230863465674813919123162824586
      17866458359124566529476545682848912883142607690042
      24219022671055626321111109370544217506941658960408
      07198403850962455444362981230987879927244284909188
      84580156166097919133875499200524063689912560717606
      05886116467109405077541002256983155200055935729725
      71636269561882670428252483600823257530420752963450
    INPUT
    test_cases = [
      ["small forward", "2345", 2, 20],
      ["small reverse", "5432", 2, 20],
      ["official example", official_input, 4, 5832],
      ["official problem", official_input, 13, 23514624000],
    ]
    test_cases.each do |name, input, product_length, solution|
      it "solves #{name}" do
        expect(PartialProduct.solve(input, product_length)).to eq(
          solution)
      end
    end
  end
end
