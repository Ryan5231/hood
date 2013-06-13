class Choice < ActiveRecord::Base
  attr_accessible :content, :neighbor_id, :listing_id
  belongs_to :listing
  belongs_to :neighbor, :class_name => "User"
  has_many :votes    
end
