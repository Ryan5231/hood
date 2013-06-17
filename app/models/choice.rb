class Choice < ActiveRecord::Base
  attr_accessible :content, :neighbor_id, :listing_id
  belongs_to :listing
  belongs_to :neighbor, :class_name => "User"
  has_many :votes

  validates :content, :neighbor_id, :listing_id, :presence => true
  validates :neighbor_id, :listing_id, :numericality => true

  def vote_count
  	self.votes.size
  end


end
