require './arithmetic'

class Calculator
  include Arithmetic

  def add(*operands)
    raise ArgumentError if operands.include? nil
    self.addition(operands)
  end

  def subtract(*operands)
    raise ArgumentError if operands.include? nil
    self.subtraction(operands)
  end
end
