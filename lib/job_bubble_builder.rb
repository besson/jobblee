class JobBubbleBuilder

  def self.build_from_facet(facet_map)
    metric = Metric.create!(name: "position")

    facet_map.each do |pos|
      pos_name = pos["value"]

      pos["pivot"].each do |comp|

        comp["pivot"].each do |geo|
          geo_loc = geo["value"].split(",")
          location = Location.create!(latitude: geo_loc[0], longitude: geo_loc[1])

          Bubble.create!(name: pos_name, value: geo["count"], metric: metric, location: location)
        end
      end
    end
  end
end
