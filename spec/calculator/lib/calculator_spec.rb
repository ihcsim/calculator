RSpec.describe Calculator do
  before(:each) do
    @calculator = Calculator.new
  end

  describe '#add' do
    context 'when given nil operands' do
      it 'raises an error' do
        expect{@calculator.add(nil)}.to raise_error ArgumentError
        expect{@calculator.add(1, nil)}.to raise_error ArgumentError
        expect{@calculator.add(1, 2, nil)}.to raise_error ArgumentError
        expect{@calculator.add(1, 2, 3, nil)}.to raise_error ArgumentError
        expect{@calculator.add(nil, 1)}.to raise_error ArgumentError
        expect{@calculator.add(nil, 1, 2)}.to raise_error ArgumentError
        expect{@calculator.add(nil, 1, 2, 3)}.to raise_error ArgumentError
      end
    end

    context 'when given one operand' do
     it 'preserves the value of the operand' do
       expect(@calculator.add(1)).to eq(1)
       expect(@calculator.add(10)).to eq(10)
       expect(@calculator.add(100)).to eq(100)
       expect(@calculator.add(1000)).to eq(1000)
       expect(@calculator.add(10000)).to eq(10000)
       expect(@calculator.add(100000)).to eq(100000)
     end
    end

    context 'when given at least two operands' do
      it 'returns the summation of all operands' do
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

  describe '#subtract' do
    context 'when given nil operands' do
      it 'raises an error' do
        expect{@calculator.subtract(nil)}.to raise_error ArgumentError
        expect{@calculator.subtract(1, nil)}.to raise_error ArgumentError
        expect{@calculator.subtract(1, 2, nil)}.to raise_error ArgumentError
        expect{@calculator.subtract(1, 2, 3, nil)}.to raise_error ArgumentError
        expect{@calculator.subtract(nil, 1)}.to raise_error ArgumentError
        expect{@calculator.subtract(nil, 1, 2)}.to raise_error ArgumentError
        expect{@calculator.subtract(nil, 1, 2, 3)}.to raise_error ArgumentError
      end
    end

    context 'when given one operand' do
     it 'preserves the value of the operand' do
       expect(@calculator.subtract(1)).to eq(1)
       expect(@calculator.subtract(10)).to eq(10)
       expect(@calculator.subtract(100)).to eq(100)
       expect(@calculator.subtract(1000)).to eq(1000)
       expect(@calculator.subtract(10000)).to eq(10000)
       expect(@calculator.subtract(100000)).to eq(100000)
     end
    end

    context 'when given at least two operands' do
      it 'performs a left-to-right subtraction of all the operands' do
        expect(@calculator.subtract(10, 5)).to eq(5)
        expect(@calculator.subtract(25, 10)).to eq(15)
        expect(@calculator.subtract(-75, -11)).to eq(-64)
        expect(@calculator.subtract(55, 5, 20)).to eq(30)
        expect(@calculator.subtract(40, 50, 10)).to eq(-20)
        expect(@calculator.subtract(68, 51, 10)).to eq(7)
        expect(@calculator.subtract(-75, 5, -10)).to eq(-70)
        expect(@calculator.subtract(0, 0, 0, 13)).to eq(-13)
        expect(@calculator.subtract(0, 0, 0, -35)).to eq(35)
        expect(@calculator.subtract(19, 7, 1, 1)).to eq(10)
        expect(@calculator.subtract(53, 90, 16, 10)).to eq(-63)
        expect(@calculator.subtract(13, 15, -10, -11)).to eq(19)
      end
    end
  end


end
