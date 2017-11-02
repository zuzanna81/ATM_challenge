require './lib/person'
require './lib/atm'

describe Person do
  subject { described_class.new({name: 'Zuzanna'}) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end
end
