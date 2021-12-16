require 'journey'
describe Journey do
  subject(:journey) { described_class.new }
  let(:station) { double :station }

    describe "# - testing 3 stages" do
    
      it 'is initially not a journey' do
        expect(subject).not_to be_in_journey
      end 
      it 'starting a journey' do
        j = Journey.new
        j.starting_journey(station)
        expect(j).to be_in_journey 
      end
      
      it 'starting a journey' do
        j = Journey.new
        j.ending_journey(station)
        expect(j).to_not be_in_journey 
      end
    end

    describe "#Calculate fare" do
      it 'has a fare set by default' do
        expect(subject.fare).to eq Journey::FARE
      end
    
      it "confirms journey is complete" do
        expect(subject.ending_journey(station)).to eq(station)
      end

      it "fare calculated based on the card being touched at the exit station" do
        
        expect(subject.calculate_penalty(:station)).to eq Journey::FARE
      end  
     
    end
end