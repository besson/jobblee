require "rails_helper"

describe StatsParser do

  it "should create a bubble stats map" do
    expect(StatsParser.bubble_map(bubble_array)).to eq({"engineer" => 22.00, "analyst" => 13.0})
  end

  def bubble_array
    bubble_array = []
    bubble_array << Bubble.new(name: "engineer", value: 22.0)
    bubble_array << Bubble.new(name: "analyst", value: 13.0)
    bubble_array
  end
end

