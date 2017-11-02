class Account

  attr_accessor :pin_code


  def initialize
    @pin_code = generate_pin
  end

private
 def generate_pin
   rand(1000..9999)
 end

end
