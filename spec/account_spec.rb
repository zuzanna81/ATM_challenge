require './lib/account'
require 'date'

describe Account do
  it 'check length of a pin code' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end




end
