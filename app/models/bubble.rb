class Bubble < ActiveRecord::Base
  belongs_to :metric
  has_many :categorizations
  has_many :categories, through: :categorizations
end
