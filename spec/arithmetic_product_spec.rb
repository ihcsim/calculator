require_relative '../lib/arithmetic'

RSpec.describe Arithmetic do
  before(:all) do
    ArithmeticProductSpy.spy_product
  end

  after(:all) do
    ArithmeticProductSpy.remove_spy 
  end

  let(:calculator) {Calculator.new}

  describe '#product' do
    context 'when multiplication is invoked' do
      it 'all operands are multiplied' do
        calculator.multiply(1, 2)
        expect(calculator.spy_result).to eq('1*2=2')

        calculator.multiply(11, 22)
        expect(calculator.spy_result).to eq('11*22=242')

        calculator.multiply(50, 67)
        expect(calculator.spy_result).to eq('50*67=3350')

        calculator.multiply(89, 46)
        expect(calculator.spy_result).to eq('89*46=4094')

      end
    end
  end
end
