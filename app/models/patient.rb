class Patient < ActiveRecord::Base
  belongs_to :nurse
  has_many :evaluation
end
