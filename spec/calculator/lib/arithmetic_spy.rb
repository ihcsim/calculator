class ArithmeticSpy

  # Inject a spy into the Arithmetic.increment method.
  # The spy records the operands passed into the Arithmetic.increment method.
  def self.spy_increment
    Arithmetic.class_eval do
      alias_method :original_increment, :increment
      define_method :increment do |operand1, operand2|
        @spy ||= "#{operand1}"
        @spy << " + #{operand2}" # add a spy to track increment algorithm
        original_increment operand1, operand2
      end

      define_method :spy_result do
        @spy
      end

      define_method :clear_spy_result do
        @spy = nil
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
