require 'station'

describe Station do
  subject {Station.new("Oxford", 1)}

  it "checks that a station has a name" do
    expect(subject.name).to eq "Oxford"
  end
  
end