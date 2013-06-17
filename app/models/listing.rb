class Listing < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :title, :description, :address, :neighborhood_id, :realtor_id, :image
=======
  attr_accessible :title, :description, :address, :neighborhood_id, :realtor_id, :status
>>>>>>> master
  belongs_to :neighborhood
  belongs_to :realtor, :class_name => "User"
  has_many :choices
  mount_uploader :image, ListingImageUploader

  validates :title, :description, :neighborhood_id, :realtor_id, :address, :presence => true
  validates :realtor_id, :neighborhood_id, :numericality => true
  validates :status, :inclusion => { :in => ['active', 'inactive'], :message => "Not a valid status"}
end


