class User < ActiveRecord::Base
  attr_accessible :username, :email
  has_many :neighborhoods, :foreign_key => "neighbor_id"
  has_many :listings, :foreign_key => "realtor_id"
  has_many :votes, :foreign_key => "neighbor_id"
  has_many :choices, :foreign_key => "neighbor_id"
end
