class Comment < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :post_id

  belongs_to :post
  belongs_to :user

  validates :title, :content, :user_id, :post_id, :presence => true

end