require './arithmetic'

class Calculator
  include Arithmetic

  def add(*operands)
    raise ArgumentError if operands.include? nil
    @result = self.addition(operands)
  end

  def subtract(*operands)
    raise ArgumentError if operands.include? nil
    @result = self.subtraction(operands)
  end
end
