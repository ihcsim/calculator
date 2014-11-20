class ArithmeticProductSpy
  def self.spy_product
    Arithmetic.class_eval do
      alias_method :original_product, :product
      define_method :product do |operand1, operand2|
        @spy ||= ''
        @spy = operand1.to_s if @spy.empty?
        @spy << "*#{operand2}"
        @result = original_product operand1, operand2
      end

      define_method :spy_result do
        spy_result = @spy + "=#{@result}"
        @spy.clear
        spy_result
      end
    end
  end

  def self.remove_spy
    Arithmetic.class_eval do
      alias_method :product, :original_product
      remove_method :spy_result
      remove_method :original_product
    end
  end
end
