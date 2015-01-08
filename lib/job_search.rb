class JobSearch

  def self.pivot_facet()
      solr_host = Rails.configuration.solr_host
      solr_query = "select?q=*:*&facet=on&facet.pivot=title,company,geo_location&wt=json&rows=0"
      response = HTTParty.get("#{solr_host}/#{solr_query}")

      return JSON.parse(response.body)["facet_counts"]["facet_pivot"]["title,company,geo_location"]
  end
end
