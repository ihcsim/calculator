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

        calculator.multiply(-50, 67)
        expect(calculator.spy_result).to eq('-50*67=-3350')

        calculator.multiply(89, 46)
        expect(calculator.spy_result).to eq('89*46=4094')

        calculator.multiply(3, -4, 5)
        expect(calculator.spy_result).to eq('3*-4*5=-60')

        calculator.multiply(22, 45, 78)
        expect(calculator.spy_result).to eq('22*45*78=77220')

        calculator.multiply(145, 105, 199)
        expect(calculator.spy_result).to eq('145*105*199=3029775')

        calculator.multiply(231, 333, 523)
        expect(calculator.spy_result).to eq('231*333*523=40230729')

        calculator.multiply(3, 3, 3, 3)
        expect(calculator.spy_result).to eq('3*3*3*3=81')

        calculator.multiply(0, -14, 37, 52)
        expect(calculator.spy_result).to eq('0*-14*37*52=0')

        calculator.multiply(94, 113, 189, 340)
        expect(calculator.spy_result).to eq('94*113*189*340=682569720')

        calculator.multiply(107, 176, 222, 456)
        expect(calculator.spy_result).to eq('107*176*222*456=1906401024')

      end
    end
  end
end
