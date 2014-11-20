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
      result = product result, operand
    end
    result
  end

  def multiplication_by_increment(operands) 
    @product_is_negative = false
    result = operands.shift
    operands.each do |operand|
      operand_is_negative = operand < 0 ? true : false
      validate_product_sign operand_is_negative
      count = 1
      factor = result
      repeats = operand_is_negative ? operand * -1 : operand
      until count == repeats
        result = increment result, factor
        count += 1
      end
    end
    result *= -1 if product_is_negative?
    result
  end

  private
  def increment(operand1, operand2)
    operand1 + operand2
  end

  def product(operand1, operand2)
    operand1 * operand2
  end

  def validate_product_sign(operand_is_negative)
    @product_is_negative = 
      if @product_is_negative && operand_is_negative 
        false 
      elsif (!@product_is_negative && !operand_is_negative)
        false
      else
        true
      end
  end

  def product_is_negative?
    @product_is_negative
  end

end
