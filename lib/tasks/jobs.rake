namespace :jobs do
  desc "Setting metric"
  task metric: :environment do
    Metric.where(name: "position").destroy_all
    Metric.create(name: "position")
  end

  desc "Loading locations"
  task location: :environment do
    file = File.open("data/state_latlon.csv", "r")
    file.each_line do |line|
      data = line.split(",")
      Location.where(country: "US").where(state: data[0]).destroy_all
      location = Location.create!(country: "US", state: data[0], latitude: data[1], longitude: data[2])
      puts "location: #{location.state} => #{location.latitude}, #{location.longitude} "
    end
  end

  desc "Loading job bubbles"
  task bubble: :environment do
    metric = Metric.find_by name: "position"
    Bubble.where(metric:metric).destroy_all

    bubbles = JobBubbleBuilder.build_from_facet(JobSearch.pivot_facet)
  end

end
