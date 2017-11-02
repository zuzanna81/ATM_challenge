class Account

  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code


  def initialize
    @pin_code = generate_pin
  end

  def exp_date
    Date.today.next_year(Account: STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

private
 def generate_pin
   rand(1000..9999)
 end


end
