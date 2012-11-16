class Organization < ActiveRecord::Base
  attr_accessible :name

  has_many :stores, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
end
