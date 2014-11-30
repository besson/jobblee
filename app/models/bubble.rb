class Bubble < ActiveRecord::Base
  belongs_to :metric
  belongs_to :location
  has_many :categorizations
  has_many :categories, through: :categorizations

  def to_map
    self
  end
end
