require "rails_helper"

describe Bubble do
  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:location) }

  it "location should contain state, latitude and longitude" do
    bubble = FactoryGirl.build(:bubble)
    expect(bubble.location).to equal({state: "CA", latitude: 36.17, longitude: -119.7462})
  end

end