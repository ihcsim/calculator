require './calculator'

RSpec.describe Calculator do
  before(:each) do
    @calculator = Calculator.new
  end

  describe '#add' do
    context "with at least two arguments" do
      it 'returns the sum of its arguments' do
        expect(@calculator.add(1, 2)).to eq(3)
        expect(@calculator.add(11, 21)).to eq(32)
        expect(@calculator.add(76, 21)).to eq(97)
        expect(@calculator.add(1, 2, 3)).to eq(6)
        expect(@calculator.add(11, 21, 13)).to eq(45)
        expect(@calculator.add(76, 21, 51)).to eq(148)
        expect(@calculator.add(1, 2, 3, 4)).to eq(10)
        expect(@calculator.add(11, 21, 13, 19)).to eq(64)
        expect(@calculator.add(76, 21, 51, 33)).to eq(181)

        # some negative operands
        expect(@calculator.add(-5, -9)).to eq(-14)
        expect(@calculator.add(11, -21)).to eq(-10)
        expect(@calculator.add(-76, 17)).to eq(-59)
        expect(@calculator.add(-1, -2, 3)).to eq(0)
        expect(@calculator.add(-20, 21, 13)).to eq(14)
        expect(@calculator.add(-60, 70, 13)).to eq(23)
        expect(@calculator.add(-1, -2, -3, -4)).to eq(-10)
        expect(@calculator.add(20, -33, 13, 0)).to eq(0)
        expect(@calculator.add(71, -21, -51, 33)).to eq(32)
      end
    end
  end
end
