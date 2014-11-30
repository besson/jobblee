namespace :jobs do
  desc "Setting metric"
  task metric: :environment do
    Metric.where(name: "position").destroy_all
    Metric.create(name: "position")
  end

  desc "Loading locations"
  task categorie: :environment do
  end

  desc "TODO"
  task bubble: :environment do
    metric = Metric.find_by name: "position"
    Bubble.where(metric:metric).destroy_all
    response = HTTParty.get('http://localhost:8983/solr/jobs/select?q=*:*&facet=on&facet.field=title&wt=json&rows=0')

    jobs = JSON.parse(response.body)["facet_counts"]["facet_fields"]["title"]
    jobs.each_slice(2) do |job|
      bubble = Bubble.create!(name: job[0], value: job[1], metric: metric)
      puts bubble.name
    end

  end

end
