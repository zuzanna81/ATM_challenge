class Person

attr_accessor :name, :cash, :account

def initialize(attrs = {})
  @name = set_name(attrs[:name])
  @cash = 0
end

private

def set_name(name)
  name == nil ? missing_name : @name = name
  #name.nil? ? missing_name : name
end

def missing_name
  raise 'A name is required'
end

end
