class Account

  STANDARD_VALIDITY_YRS = 5
  attr_accessor :balance, :account_status, :owner
  attr_reader :pin_code, :exp_date


  def initialize(attrs = {}) #hash that allows you to have as many arguments as you want
    @pin_code = generate_pin
    @balance = 0
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def exp_date
    Date.today.next_year(Account: STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def self.deactivate(account)
    #Account.deactivate(object)
    account.account_status = :deactivated
  end

  def deactivate
    #object.deactivate
    @account_status = :deactivated
  end

private

 def generate_pin
   rand(1000..9999)
 end

 def set_owner(person)
   person == nil ? missing_owner : @owner = person #if person missing => missing person, else owner
 end

 def missing_owner
   raise "An account owner is required"
 end

end
