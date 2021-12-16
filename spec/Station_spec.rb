require 'station'

describe Station do
  subject {described_class.new( "Oxford", "1" )}
  
  context "checks for station details" do 
    it "checks that a station has a name" do
      expect(subject.name).to eq "Oxford"
    end

    it "checks that a station has a zone" do
      expect(subject.zone).to eq "1"
    end
  end
end