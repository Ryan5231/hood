class Vote < ActiveRecord::Base
  attr_accessible :neighbor_id, :choice_id

  belongs_to :choice
  belongs_to :neighbor, :class_name => "User"

  validates :choice_id, :neighbor_id, :presence => true
  validates :choice_id, :neighbor_id, :numericality => true
end

