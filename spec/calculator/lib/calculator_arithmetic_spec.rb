RSpec.describe Arithmetic do
  before(:all) do
    ArithmeticSpy.spy_increment
  end

  after(:all) do
    ArithmeticSpy.remove_spy
  end

  let(:calculator) {Calculator.new}

  describe '#increment' do
    context 'when addition is invoked' do
      it 'all operands are added' do
        calculator.add(1, 2)
        expect(calculator.spy_result).to eq("1 + 2")

        calculator.add(11, 22)
        expect(calculator.spy_result).to eq("11 + 22")
        
        calculator.add(21, 34, 78)
        expect(calculator.spy_result).to eq("21 + 34 + 78")
        
        calculator.add(101, 248, 367, 478)
        expect(calculator.spy_result).to eq("101 + 248 + 367 + 478")

        calculator.add(567, 634, 711, 890, 956, 1001)
        expect(calculator.spy_result).to eq("567 + 634 + 711 + 890 + 956 + 1001")
      end
    end

    context 'when subtraction is invoked' do
      it 'all operands are subtracted from left-to-right' do
        calculator.subtract(4, 1)
        expect(calculator.spy_result).to eq("4 - 1")
        
        calculator.subtract(78, 54, 10)
        expect(calculator.spy_result).to eq("78 - 54 - 10")
 
        calculator.subtract(321, 476, 111, 789)
        expect(calculator.spy_result).to eq("321 - 476 - 111 - 789")

        calculator.subtract(976, 322, 45, 7, 1234)
        expect(calculator.spy_result).to eq("976 - 322 - 45 - 7 - 1234")
      end 
    end
  end
end
