class CompanyBubbleBuilder

  def self.build_from_facet(facet_array)
    metric = Metric.create!(name: "company")

    facet_array.each_slice(2) { |comp_name, comp_value|
      Bubble.create!(name: comp_name, value: comp_value, metric: metric)
    }

  end
end
