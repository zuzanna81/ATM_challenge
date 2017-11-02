class Account

  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :account_status, :owner


  def initialize(attr = {})
    @pin_code = generate_pin
    @account_status = :active
    set_owner(attr[:owner])
  end

  def exp_date
    Date.today.next_year(Account: STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def deactivate
    @account_status = :deactivated
  end

private

 def generate_pin
   rand(1000..9999)
 end

 def set_owner(obj)
   obj == nil ? missing_owner : @owner = obj
 end

 def missing_owner
   raise "An account owner is required"
 end

end
