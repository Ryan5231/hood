class Listing < ActiveRecord::Base
  attr_accessible :title, :description, :address, :neighborhood, :realtor
  belongs_to :neighborhood
  belongs_to :realtor, :class_name => "User"
  has_many :choices
end
