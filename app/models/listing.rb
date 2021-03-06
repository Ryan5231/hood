class Listing < ActiveRecord::Base
  attr_accessible :title, :description, :address, :neighborhood_id, :realtor_id, :status, :image
  belongs_to :neighborhood
  belongs_to :realtor, :class_name => "User"
  has_many :choices
  has_many :comments
  mount_uploader :image, ListingImageUploader

  validates :title, :description, :neighborhood_id, :realtor, :address, :presence => true
  validates :status, :inclusion => { :in => ['active', 'inactive'], :message => "Not a valid status"}
end


