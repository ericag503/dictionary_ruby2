require 'rspec'
require 'term'

describe 'Term'  do
  it 'initializes an instance of Term'  do
  test_term = Term.new({:word => 'carrot', :definition => 'a delicious vegetable'})
  expect(test_term).to be_an_instance_of Term
  end
end
