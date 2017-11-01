require "p006a"

solutions = [
  DirectSolution,
  CombinationsSolution,
  DynamicProgrammingSolution
]
solutions.each do |solution|
  RSpec.describe solution do
    test_cases = {
      0 => 0,
      1 => 0,
      2 => 4,
      3 => 22,
      10 => 2_640,
      50 => 1_582_700,
      100 => 25_164_150
    }
    test_cases.each do |input, output|
      it "solves #{input}" do
        expect(solution.solve(input)).to eq(output)
      end
    end
  end
end
