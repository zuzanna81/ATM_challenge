require './lib/account'
require 'date'

describe Account do
  it 'check length of a pin code' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end

  it 'expect to have an expiry date on initialize' do
    exp_date = Date.today.next_year(5).strftime("%m/%y")
    expect(exp_date).to eq '11/22'
  end

  it 'expect to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivate account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

end
