require 'oystercard'

describe Oystercard do 
  
  describe "#testing balance" do
    it 'has balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'has balance = 0' do
      expect(subject.balance).to eq (0)
    end
  end
  describe "#testing top up" do

    it 'can be topped up' do
      expect { subject.top_up(5) }.to change {subject.balance}.from(0).to(5)
    end

    it 'checks top-up limit' do
      expect {subject.top_up(91)}.to raise_error "Error: max balance hit #{Oystercard::LIMIT}"
    end

  end

  describe "#testing deduct" do
    it 'tests that fare is deducted from the card' do
      card = Oystercard.new
      card.top_up(10)
      expect {card.deduct}.to change {card.balance}.from(10).to(4)
    end
  end

  describe '#card in journey at the beginning' do
    context 'in journey' do
      it 'is true' do
        expect(subject.in_journey?).to be false
      end
    end

    context '#touching in' do
      it 'checks if card "in journey" is true' do
        card = Oystercard.new
        card.touch_in
        expect(card.in_journey?).to eq true
      end
    end

    context '#touching out' do
      it 'checks if card "in journey" is false' do
        card = Oystercard.new
        card.touch_out
        expect(card.in_journey?).to eq false
      end
    end
  end


end