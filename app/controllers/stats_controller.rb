class StatsController < ApplicationController

  def index
    @top_jobs = Stats.top5jobs
    @top_locations = Stats.top5locations
    @companies = Stats.companies
  end

end
