class JobSearch

  def self.pivot_facet()
      solr_host = "http://localhost:8983/solr/jobs"
      response = HTTParty.get("#{solr_host}/select?q=*:*&facet=on&facet.pivot=title,company,geo_location&wt=json&rows=0")

      return JSON.parse(response.body)["facet_counts"]["facet_pivot"]["title,company,geo_location"]
  end
end
