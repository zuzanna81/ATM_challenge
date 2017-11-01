require './lib/account'
require './lib/atm'
require 'date'

describe Account do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '12/17', account_status: :active) }


end
