require "rails_helper"

describe CompanySearch do
  let(:json_response) { double(body: File.read('spec/fixtures/facet_field_response.json'))}

  it "should mount a simple facet query" do
    query = /facet.field=company/
    expect(HTTParty).to receive(:get).with(query).and_return(json_response)
    CompanySearch.facet
  end

  it "should return a facet map" do
    expect(HTTParty).to receive(:get).and_return(json_response)
    response = CompanySearch.facet

    expect(response[0]).to eq("amazon")
    expect(response[1]).to eq(1799)
  end

end
