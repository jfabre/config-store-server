class Store < ActiveRecord::Base
  attr_accessible :name

  belongs_to :organization
  has_many :pairs, :dependent => :destroy

  validates_uniqueness_of :name, :scope => :organization_id
end
