class Address < ActiveRecord::Base
  belongs_to :user
  
  scope :enabled, where(:enabled => true)
end
