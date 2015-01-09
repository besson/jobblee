require "rails_helper"

describe CompanyBubbleBuilder do

  it "should build an array of company bubbles" do
    response = ["amazon", 1799, "facebook", 450, "walmart.com", 66]
    expect(CompanySearch).to receive(:facet).and_return(response)

    bubbles = CompanyBubbleBuilder.build_from_facet(CompanySearch.facet)

    bubbles = Bubble.all
    expect(bubbles.size).to eq(3)

    bubble = Bubble.first
    expect(bubble.name).to eq("amazon")
    expect(bubble.value).to eq(1799)
    expect(bubble.metric.name).to eq("company")

  end

end

