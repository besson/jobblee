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

  desc "TODO"
  task bubble: :environment do
    metric = Metric.find_by name: "position"
    Bubble.where(metric:metric).destroy_all

    Location.all.each do |location|
      response = HTTParty.get("http://localhost:8983/solr/jobs/select?q=*:*&fq=location:'#{location.state}'&facet=on&facet.field=title&wt=json&rows=0")
      jobs = JSON.parse(response.body)["facet_counts"]["facet_fields"]["title"]

      jobs.each_slice(2) do |job|
        if (job[1] > 5)
          bubble = Bubble.create!(name: job[0], value: job[1], metric: metric, location: location)
          puts "#{bubble.name} located at #{location.state}"
        end
      end

    end
  end

end
