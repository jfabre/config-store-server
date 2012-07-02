class Store < ActiveRecord::Base
  attr_accessible :name

  belongs_to :organization
  has_many :pairs
end
