class ArithmeticSpy

  # Inject a spy into the Arithmetic.increment method.
  # The spy records the operands passed into the Arithmetic.increment method.
  def self.spy_increment
    Arithmetic.class_eval do
      alias_method :original_increment, :increment
      define_method :increment do |operand1, operand2|
        if operand2 > 0
          operation = '+'
        else
          operation = '-'
          operand2 = -1 * operand2
        end

        @spy ||= "#{operand1}"
        @spy << " #{operation} #{operand2}" # add a spy to track increment algorithm
        original_increment operand1, operand2
      end

      define_method :spy_result do
        result = @spy
        @spy = nil
        result
      end
    end
  end

  # Removes spy from the Arithmeic.increment method by undoing changes introduced
  # by self.spy_increment.
  def self.remove_spy
    Arithmetic.class_eval do
      alias_method :increment, :original_increment
      remove_method :original_increment
      remove_method :spy_result
    end
  end
end
