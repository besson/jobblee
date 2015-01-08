class Stats < ActiveRecord::Base

  scope :top5jobs, -> { Bubble.select(:name, :value).order("value desc").limit(5) }
  scope :top5locations, -> { Location.joins(:bubbles).group(:longitude, :latitude).order('count_id desc').count('id').first(5) }

end
