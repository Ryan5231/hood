class User < ActiveRecord::Base
 
  attr_accessible :username, :email, :password, :password_confirmation, :type, :neighborhoods_id
  
  has_and_belongs_to_many :neighborhoods
  has_many :comments

  has_many :listings, :foreign_key => "realtor_id"
  has_many :votes, :foreign_key => "neighbor_id"
  has_many :choices, :foreign_key => "neighbor_id"

  has_secure_password

  validates :username, :email, :presence => true
  validates :password, :presence => true, :on => :create
  validates :username, :email, :uniqueness => true
  validates :email, :format => { :with => /.*[@].*[\.].*/}
  validates :password, :length => { :in => 6..20 }, :on => :create

end
