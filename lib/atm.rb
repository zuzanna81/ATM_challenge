class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when insufficient_funds_in_account?(amount, pin_code, account)
      { status: false, message: 'insufficient funds in account', date: Date.today }
    when insufficient_funds_in_atm?(amount, pin_code, account)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: 'wrong pin', date: Date.today }
    when card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today }
    when account_not_active?(account.account_status)
      { status: false, message: 'account disabled', date: Date.today }
    else
      perform_transaction(amount, pin_code, account)
    end

end

private

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def insufficient_funds_in_atm?(amount, pin_code, account)
    @funds < amount
  end

  def insufficient_funds_in_account?(amount, pin_code, account)
    amount > account.balance
  end

  def perform_transaction(amount, pin_code, account)
    @funds -= amount
    account.balance = account.balance - amount
    { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def account_not_active?(account_status)
    account_status != :active
  end

end
