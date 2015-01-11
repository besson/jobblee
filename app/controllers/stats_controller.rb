class StatsController < ApplicationController

  def index
    @top_jobs = StatsParser.bubble_map(Stats.top5jobs)
    @top_locations = Stats.top5locations
    @companies = Stats.companies
  end

end
