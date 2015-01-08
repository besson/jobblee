class CompanySearch

  def self.facet()
      solr_host = Rails.configuration.solr_host
      solr_query = "select?q=*:*&facet=on&facet.field=company&wt=json&rows=0"
      response = HTTParty.get("#{solr_host}/#{solr_query}")

      return JSON.parse(response.body)["facet_counts"]["facet_fields"]["company"]
  end
end
