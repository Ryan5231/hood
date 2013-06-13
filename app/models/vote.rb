class Vote < ActiveRecord::Base
  attr_accessible :neighbor_id, :choice_id
end
