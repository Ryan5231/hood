class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :listing_id

  belongs_to :user
  belongs_to :listing
  has_many :comments

  validates :title, :content, :user_id, :listing_id, :presence => true

end
