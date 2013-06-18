class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :listing_id

  belongs_to :user
  belongs_to :listing

  validates :content, :user_id, :listing_id, :presence => true

end
