require_relative '../lib/calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    context 'when given nil operands' do
      it 'raises an error' do
        expect{calculator.add(nil)}.to raise_error ArgumentError
        expect{calculator.add(1, nil)}.to raise_error ArgumentError
        expect{calculator.add(1, 2, nil)}.to raise_error ArgumentError
        expect{calculator.add(1, 2, 3, nil)}.to raise_error ArgumentError
        expect{calculator.add(nil, 1)}.to raise_error ArgumentError
        expect{calculator.add(nil, 1, 2)}.to raise_error ArgumentError
        expect{calculator.add(nil, 1, 2, 3)}.to raise_error ArgumentError
      end
    end

    context 'when given one operand' do
     it 'preserves the value of the operand' do
       expect(calculator.add(1)).to eq(1)
       expect(calculator.add(10)).to eq(10)
       expect(calculator.add(100)).to eq(100)
       expect(calculator.add(1000)).to eq(1000)
       expect(calculator.add(10000)).to eq(10000)
       expect(calculator.add(100000)).to eq(100000)
     end
    end

    context 'when given at least two operands' do
      it 'returns the summation of all operands' do
        expect(calculator.add(1, 2)).to eq(3)
        expect(calculator.add(11, 21)).to eq(32)
        expect(calculator.add(76, 21)).to eq(97)
        expect(calculator.add(1, 2, 3)).to eq(6)
        expect(calculator.add(11, 21, 13)).to eq(45)
        expect(calculator.add(76, 21, 51)).to eq(148)
        expect(calculator.add(1, 2, 3, 4)).to eq(10)
        expect(calculator.add(11, 21, 13, 19)).to eq(64)
        expect(calculator.add(76, 21, 51, 33)).to eq(181)

        # some negative operands
        expect(calculator.add(-5, -9)).to eq(-14)
        expect(calculator.add(11, -21)).to eq(-10)
        expect(calculator.add(-76, 17)).to eq(-59)
        expect(calculator.add(-1, -2, 3)).to eq(0)
        expect(calculator.add(-20, 21, 13)).to eq(14)
        expect(calculator.add(-60, 70, 13)).to eq(23)
        expect(calculator.add(-1, -2, -3, -4)).to eq(-10)
        expect(calculator.add(20, -33, 13, 0)).to eq(0)
        expect(calculator.add(71, -21, -51, 33)).to eq(32)
      end
    end
  end

  describe '#subtract' do
    context 'when given nil operands' do
      it 'raises an error' do
        expect{calculator.subtract(nil)}.to raise_error ArgumentError
        expect{calculator.subtract(1, nil)}.to raise_error ArgumentError
        expect{calculator.subtract(1, 2, nil)}.to raise_error ArgumentError
        expect{calculator.subtract(1, 2, 3, nil)}.to raise_error ArgumentError
        expect{calculator.subtract(nil, 1)}.to raise_error ArgumentError
        expect{calculator.subtract(nil, 1, 2)}.to raise_error ArgumentError
        expect{calculator.subtract(nil, 1, 2, 3)}.to raise_error ArgumentError
      end
    end

    context 'when given one operand' do
     it 'preserves the value of the operand' do
       expect(calculator.subtract(1)).to eq(1)
       expect(calculator.subtract(10)).to eq(10)
       expect(calculator.subtract(100)).to eq(100)
       expect(calculator.subtract(1000)).to eq(1000)
       expect(calculator.subtract(10000)).to eq(10000)
       expect(calculator.subtract(100000)).to eq(100000)
     end
    end

    context 'when given at least two operands' do
      it 'performs a left-to-right subtraction of all the operands' do
        expect(calculator.subtract(10, 5)).to eq(5)
        expect(calculator.subtract(25, 10)).to eq(15)
        expect(calculator.subtract(-75, -11)).to eq(-64)
        expect(calculator.subtract(55, 5, 20)).to eq(30)
        expect(calculator.subtract(40, 50, 10)).to eq(-20)
        expect(calculator.subtract(68, 51, 10)).to eq(7)
        expect(calculator.subtract(-75, 5, -10)).to eq(-70)
        expect(calculator.subtract(0, 0, 0, 13)).to eq(-13)
        expect(calculator.subtract(0, 0, 0, -35)).to eq(35)
        expect(calculator.subtract(19, 7, 1, 1)).to eq(10)
        expect(calculator.subtract(53, 90, 16, 10)).to eq(-63)
        expect(calculator.subtract(13, 15, -10, -11)).to eq(19)
      end
    end
  end

  describe '#multiply' do
    context 'when given a nil operand' do
      it 'raises an error' do
        expect{calculator.multiply(nil)}.to raise_error ArgumentError
        expect{calculator.multiply(nil, 1)}.to raise_error ArgumentError
        expect{calculator.multiply(nil, 10, 20)}.to raise_error ArgumentError
        expect{calculator.multiply(32, nil, 56)}.to raise_error ArgumentError
        expect{calculator.multiply(47, 78, nil)}.to raise_error ArgumentError
        expect{calculator.multiply(58, 98, 23, 11, nil)}.to raise_error ArgumentError
      end
    end

    context 'when given a single operand' do
      it 'preserves the value of the operand' do
        expect(calculator.multiply(1)).to eq(1)
        expect(calculator.multiply(20)).to eq(20)
        expect(calculator.multiply(300)).to eq(300)
        expect(calculator.multiply(4000)).to eq(4000)
        expect(calculator.multiply(50000)).to eq(50000)
        expect(calculator.multiply(600000)).to eq(600000)
      end
    end

    context 'when an operand is multiplied by zero' do
      it 'returns zero' do
        expect(calculator.multiply(0, 1)).to eq(0)
        expect(calculator.multiply(0, 20)).to eq(0)
        expect(calculator.multiply(0, 300)).to eq(0)
        expect(calculator.multiply(0, 4000)).to eq(0)
        expect(calculator.multiply(0, 50000)).to eq(0)
        expect(calculator.multiply(0, 600000)).to eq(0)
      end
    end

    context 'when given at least operands' do
      it 'returns the multiplication result of all the operands' do
        expect(calculator.multiply(1, 1)).to eq(1)
        expect(calculator.multiply(3, 15)).to eq(45)
        expect(calculator.multiply(10, 30, 1)).to eq(300)
        expect(calculator.multiply(24, 56, 2, 79)).to eq(212352)
        expect(calculator.multiply(56, 111, 325, 479)).to eq(967675800)
        expect(calculator.multiply(100, 241, 456, 789)).to eq(8670794400)
        expect(calculator.multiply(189, 200, 389, 611, 800)).to eq(7187412960000)
        expect(calculator.multiply(254, 356, 500, 890, 982)).to eq(39514383760000)

        # some negative operands
        expect(calculator.multiply(1, -1)).to eq(-1)
        expect(calculator.multiply(-3, 15)).to eq(-45)
        expect(calculator.multiply(10, -30, 1)).to eq(-300)
        expect(calculator.multiply(19, -34, -57)).to eq(36822)
        expect(calculator.multiply(-24, -56, -2, -79)).to eq(212352)
        expect(calculator.multiply(-100, 241, -456, 789)).to eq(8670794400)
        expect(calculator.multiply(254, 356, 500, 890, 982)).to eq(39514383760000)
        expect(calculator.multiply(412, 247, 599, 974, 1282)).to eq(76114600760848)

        expect(calculator.multiply(10, 10)).to eq(100)
        expect(calculator.multiply(20, 100)).to eq(2000)
        expect(calculator.multiply(30, 56)).to eq(1680)
        expect(calculator.multiply(44, 78)).to eq(3432)
        expect(calculator.multiply(11, 23, 32)).to eq(8096)
        expect(calculator.multiply(21, 43, 59)).to eq(53277)
        expect(calculator.multiply(19, 44, 68, 99)).to eq(5627952)
        expect(calculator.multiply(33, 69, 91, 134)).to eq(27765738)

        # testing with negative signs
        expect(calculator.multiply(1, -1)).to eq(-1)
        expect(calculator.multiply(-1, 1)).to eq(-1)
        expect(calculator.multiply(-1, -1)).to eq(1)
      end
    end
  end

  describe '#divide' do
    context 'when given a single operand' do
      it 'preserves the value of the operand' do
        expect(calculator.divide(1)).to eq(1)
        expect(calculator.divide(2)).to eq(2)
        expect(calculator.divide(3)).to eq(3)
        expect(calculator.divide(4)).to eq(4)
        expect(calculator.divide(5)).to eq(5)
        expect(calculator.divide(6)).to eq(6)
        expect(calculator.divide(7)).to eq(7)
        expect(calculator.divide(8)).to eq(8)
        expect(calculator.divide(9)).to eq(9)
        expect(calculator.divide(10)).to eq(10)
      end
    end

    context 'when an operand is divided by 1' do
      it 'preserves the value of the operand' do
        expect(calculator.divide(2, 1)).to eq(2)
        expect(calculator.divide(3, 1)).to eq(3)
        expect(calculator.divide(4, 1)).to eq(4)
        expect(calculator.divide(5, 1)).to eq(5)
        expect(calculator.divide(6, 1)).to eq(6)
        expect(calculator.divide(7, 1)).to eq(7)
        expect(calculator.divide(8, 1)).to eq(8)
        expect(calculator.divide(9, 1)).to eq(9)
        expect(calculator.divide(10, 1)).to eq(10)
      end
    end

    context 'when given at least two operands' do
      it 'performs a left-to-right division on the operands' do
        expect(calculator.divide(2, 2)).to eq(1)
        expect(calculator.divide(4, 2)).to eq(2)
        expect(calculator.divide(6, 2)).to eq(3)
        expect(calculator.divide(8, 2)).to eq(4)
        expect(calculator.divide(10, 2)).to eq(5)
        expect(calculator.divide(3, 3)).to eq(1)
        expect(calculator.divide(6, 3)).to eq(2)
        expect(calculator.divide(9, 3)).to eq(3)
        expect(calculator.divide(12, 3)).to eq(4)
        expect(calculator.divide(15, 3)).to eq(5)
        expect(calculator.divide(18, 3)).to eq(6)

        expect(calculator.divide(20, 5, 2)).to eq(2)
        expect(calculator.divide(60, 4, 3)).to eq(5)
        expect(calculator.divide(81, 9, 9)).to eq(1)
        expect(calculator.divide(99, 3, 3)).to eq(11)
        expect(calculator.divide(120, 4, 2)).to eq(15)

        expect(calculator.divide(48, 4, 2, 2)).to eq(3)
        expect(calculator.divide(64, 2, 3, 4)).to eq(2)
        expect(calculator.divide(92, 2, 2, 23)).to eq(1)
        expect(calculator.divide(140, 7, 2, 5)).to eq(2)
        expect(calculator.divide(186, 6, 31, 1)).to eq(1)
        expect(calculator.divide(200, 2, 10, 5)).to eq(2)
      end
    end

    context 'when given a nil operand' do
      it 'raises an argument error' do
        expect{calculator.divide(nil)}.to raise_error ArgumentError
      end
    end


  end
end
