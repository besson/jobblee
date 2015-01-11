class Stats < ActiveRecord::Base

  scope :top5jobs, -> { Bubble.select("name, sum(value) as value").where(metric: Metric.where(name: "position")).group(:name).order("value desc").take(5) }
  scope :top5locations, -> { Location.joins(:bubbles).group(:longitude, :latitude).order('count_id desc').count('id').first(5) }
  scope :companies, -> { Bubble.select(:name, :value).where(metric: Metric.where(name: "company")) }

end
