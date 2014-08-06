require 'rspec'
require 'term'

describe 'Term'  do
  it 'initializes an instance of Term'  do
  test_term = Term.new({:word => 'carrot', :definition => 'a delicious vegetable'})
  expect(test_term).to be_an_instance_of Term
  end

  it 'returns the word of the hash created with Term' do
  test_term = Term.new({:word => 'carrot', :definition => 'a delicious vegetable'})
  expect(test_term.word).to eq 'carrot'
  end

  it 'adds a new word including definition' do
  test_term = Term.new({:word => 'carrot', :definition => 'a delicious vegetable'})
  test_term2 = Term.new({:word => 'bread', :definition => 'grain mixture baked'})
  add_term = test_term.word_add
  add_term2 = test_term2.word_add
  expect(Term.all).to eq [test_term, test_term2]
  end
end
