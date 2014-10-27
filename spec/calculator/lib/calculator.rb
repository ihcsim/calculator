class Calculator
  def add(*operands)
    result = 0
    operands.each do |operand|
      result += operand
    end
    result
  end

  def subtract(*operands)
    result = operands.shift
    operands.each do |operand|
      result -= operand
    end
    result
  end

end
