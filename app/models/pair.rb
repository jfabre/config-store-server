class Pair < ActiveRecord::Base
  attr_accessible :key, :value

  belongs_to :store
end