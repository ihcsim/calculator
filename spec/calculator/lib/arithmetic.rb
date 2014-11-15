module Arithmetic
  def addition(operands)
    result = operands.shift
    operands.each do |operand|
      result = increment result, operand
    end
    result
  end

  def subtraction(operands)
    result = operands.shift
    operands.each do |operand|
      result = increment result, -1 * operand
    end
    result
  end

  def multiplication(operands)
    result = operands.shift
    operands.each do |operand|
      result = result * operand
    end
    result
  end

  private
  def increment(operand1, operand2)
    operand1 + operand2
  end
end
