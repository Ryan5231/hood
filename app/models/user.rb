class User < ActiveRecord::Base
 
  attr_accessible :username, :email, :password, :password_confirmation
  
  has_and_belongs_to_many :neighborhoods



  # has_many :neighborhoods, :foreign_key => "neighbor_id"



  has_many :listings, :foreign_key => "realtor_id"
  has_many :votes, :foreign_key => "neighbor_id"
  has_many :choices, :foreign_key => "neighbor_id"
  has_secure_password

  validates :username, :email, :password, :presence => true
  validates :username, :email, :uniqueness => true 
  validates :email, :format => { :with => /.*[@].*[\.].*/, :message => "must have @ and a (.)"}
  validates :password, :length => { :in => 6..20 }

end
