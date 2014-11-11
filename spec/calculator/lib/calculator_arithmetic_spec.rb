RSpec.describe 'Calculator Arithmetic Spy' do
  describe 'spy increment method' do
    context 'when addition is invoked' do
      it 'all operands are added' do
        ArithmeticSpy.spy_increment
        calculator = Calculator.new
        calculator.add(1,2)
        expect(calculator.spy_result).to eq("1 + 2")
        ArithmeticSpy.remove_spy
      end
    end
  end
end
