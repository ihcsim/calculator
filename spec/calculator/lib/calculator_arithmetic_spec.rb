RSpec.describe 'Calculator Arithmetic Spy' do
  before(:all) do
    ArithmeticSpy.spy_increment
  end

  after(:all) do
    ArithmeticSpy.remove_spy
  end

  describe 'spy increment method' do
    context 'when addition is invoked' do
      it 'all operands are added' do
        calculator = Calculator.new
        calculator.add(1,2)
        expect(calculator.spy_result).to eq("1 + 2")
      end
    end
  end
end
