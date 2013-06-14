class Neighborhood < ActiveRecord::Base
  attr_accessible :name
  has_many :listings
  has_many :realtors, :class_name => "User"
  has_and_belongs_to_many :users
  has_many :neighborhoods_users, :class_name => "NeighborhoodsUser", foreign_key: "neighborhood_id"
  has_many :neighbors, :through => :neighborhoods_users, :source => :user

  validates :name, :presence => true




end
