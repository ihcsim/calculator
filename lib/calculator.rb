require_relative './arithmetic'

class Calculator
  include Arithmetic

  def add(*operands)
    raise ArgumentError if operands.include? nil
    @result = self.addition operands
  end

  def subtract(*operands)
    raise ArgumentError if operands.include? nil
    @result = self.subtraction operands
  end

  def multiply(*operands)
    raise ArgumentError if operands.include? nil
    @result = self.multiplication operands
  end

  def divide(*operands)
    raise ArgumentError if operands.include? nil
    @result = operands.shift
    operands.each do |operand|
      @result /= operand if operand
    end
    @result
  end
end
