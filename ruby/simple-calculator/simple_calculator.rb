class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    begin
      if ALLOWED_OPERATIONS.include?(operation)
        "#{first_operand} #{operation} #{second_operand} = #{first_operand.method(operation).call(second_operand)}"
      else
        raise UnsupportedOperation
      end
    rescue TypeError
      raise ArgumentError
    rescue ZeroDivisionError
      return "Division by zero is not allowed."
    end
  end
end
