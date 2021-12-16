require 'oystercard'

describe Oystercard do 
  let(:station) {double(:station)}
  let(:station2) {double(:station2)}

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
      expect {card.send(:deduct)}.to change {card.balance}.from(10).to(4)
    end
  end

  describe '#card in journey at the beginning' do
    context '#touching in' do
      it 'checks if card "in journey" is true' do
        card = Oystercard.new
        card.top_up(5)
        card.touch_in(station)
        expect(card.in_journey?).to eq true
      end
    end

    context '#touching out' do
      it 'checks if card "in journey" is false' do
        card = Oystercard.new
        card.touch_out(station2)
        expect(card.in_journey?).to eq false
      end
    end
  end

  context '#checking min balance' do
    it 'checks if card has at least £1 on balance' do
      card = Oystercard.new
      expect {card.touch_in(station)}.to raise_error "Not enough money, less than #{Oystercard::MIN_LIMIT}"
    end
  end

  context '#checking if correct amount has been deducted from my card' do
    it "deducts fare amount from balance" do
      subject.top_up(10)
      subject.touch_in(station)
      expect {subject.touch_out(station2)}.to change {subject.balance}.by(-Oystercard::FARE)
    end
  end

  context '#needs to know where the user came from' do
    it 'records entry station' do
      subject.top_up(10)
      expect(subject.touch_in(station)).to eq station
    end
  end

  context 'fogets the station name on the touch_out' do
    it 'sets the station name to nil' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.entry_station).to eq nil
    end  
  end  

  context 'needs to see all previous trips' do
    it '' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.list_journeys
      expect(subject.list_of_journeys).to_not eq nil
    end  
  end  
  
  context 'needs to record all journeys' do
    it "checks is journey is being recorded" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.list_of_journeys).to eq [{ entry: station, exit: station2 }]
    end
  end
  
end