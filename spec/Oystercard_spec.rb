require 'oystercard'

describe Oystercard do 
  let(:card) { Oystercard.new }
  
  it 'has balance' do
    expect(card).to respond_to(:check_balance)
  end
end