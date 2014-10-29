module Arithmetic
  def addition(operands)
    result = 0
    operands.each do |operand|
      result += operand
    end
    result
  end

  def subtraction(operands)
    result = operands.shift
    operands.each do |operand|
      result -= operand
    end
    result
  end
end
