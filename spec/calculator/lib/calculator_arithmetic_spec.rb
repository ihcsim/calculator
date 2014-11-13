RSpec.describe Arithmetic do
  before(:all) do
    ArithmeticSpy.spy_increment
  end

  after(:all) do
    ArithmeticSpy.remove_spy
  end

  describe '#increment' do
    context 'when addition is invoked' do
      it 'all operands are added' do
        calculator = Calculator.new
        calculator.add(1, 2)
        expect(calculator.spy_result).to eq("1 + 2")
        calculator.clear_spy_result

        calculator.add(11, 22)
        expect(calculator.spy_result).to eq("11 + 22")
        calculator.clear_spy_result

        calculator.add(21, 34, 78)
        expect(calculator.spy_result).to eq("21 + 34 + 78")
        calculator.clear_spy_result

        calculator.add(101, 248, 367, 478)
        expect(calculator.spy_result).to eq("101 + 248 + 367 + 478")
        calculator.clear_spy_result

        calculator.add(567, 634, 711, 890, 956, 1001)
        expect(calculator.spy_result).to eq("567 + 634 + 711 + 890 + 956 + 1001")
        calculator.clear_spy_result
      end
    end
  end
end
