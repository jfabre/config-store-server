class Organization < ActiveRecord::Base
  attr_accessible :name

  has_many :stores
end
