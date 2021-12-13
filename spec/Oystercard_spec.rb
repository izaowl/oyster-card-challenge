require 'oystercard'

describe Oystercard do 
  # let(:card) { Oystercard.new }
  
  it 'has balance' do
    expect(subject).to respond_to(:balance)
  end


end