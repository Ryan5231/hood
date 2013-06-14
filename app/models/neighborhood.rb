class Neighborhood < ActiveRecord::Base
  attr_accessible :name
  has_many :listings
  has_many :realtors, :class_name => "User"
  has_many :neighbors, :class_name => "User"

  validates :name, :presence => true




end
