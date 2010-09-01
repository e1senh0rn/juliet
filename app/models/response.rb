class Response < ActiveRecord::Base
  belongs_to :website, :touch => true
  
  before_create :set_is_good
  
  GOOD = [200, 301, 302]
  
  scope :good, where(:is_good => true)
  scope :bad, where(:is_good => false)
  
  def self.is_good?(code)
    GOOD.include? code
  end
  
  def set_is_good
    self.is_good = (!self.timed_out? and self.class.is_good? code)
    true
  end
  
  
end
