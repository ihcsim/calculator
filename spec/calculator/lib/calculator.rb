require './arithmetic'

class Calculator
  include Arithmetic

  def add(*operands)
    self.addition(operands)
  end

  def subtract(*operands)
    self.subtraction(operands)
  end
end
