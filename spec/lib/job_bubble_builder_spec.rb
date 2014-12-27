require "rails_helper"

describe JobBubbleBuilder do

  it "should build an array with 3 bubbles" do
    json_response = JSON.parse(File.read("spec/fixtures/facet_pivot_entry.json"))
    expect(JobSearch).to receive(:pivot_facet).and_return(json_response)

    bubbles = JobBubbleBuilder.build_from_facet(JobSearch.pivot_facet)

    bubbles = Bubble.all
    expect(bubbles.size).to eq(3)

    bubble = bubbles.first
    expect(bubble.name).to eq("Senior Software Engineer")
    expect(bubble.value).to eq(10)
    expect(bubble.location.latitude).to eq(37.368830)
    expect(bubble.location.longitude).to eq(-122.036350)
    expect(bubble.metric.name).to eq("position")
  end
end



