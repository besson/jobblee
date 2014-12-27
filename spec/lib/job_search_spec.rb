require "rails_helper"

describe JobSearch do
  let(:json_response) { double(body: File.read('spec/fixtures/facet_pivot_response.json'))}

  it "should mount a pivot facet query" do
    query = /facet.pivot=title,company,geo_location/
    expect(HTTParty).to receive(:get).with(query).and_return(json_response)
    JobSearch.pivot_facet
  end

  it "should return a facet map" do
    expect(HTTParty).to receive(:get).and_return(json_response)
    response = JobSearch.pivot_facet

    position = response[0]
    expect(position["value"]).to eq("Senior Software Engineer")
    expect(position["count"]).to eq(17)
  end
end
