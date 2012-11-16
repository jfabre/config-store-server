class Pair < ActiveRecord::Base
  attr_accessible :key, :value

  validates_uniqueness_of :key, :scope => :store_id
  validates :key, :presence => true
  
  belongs_to :store
end