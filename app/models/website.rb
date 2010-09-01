class Website < ActiveRecord::Base
  validates :url, :uniqueness => true, :presence => true
  validates :name, :presence => true
  validates :ttl, :numericality => true, :inclusion => { :in => 0..30 }
  
  belongs_to :user
  has_many :responses, :dependent => :delete_all
  
  scope :enabled, where(:enabled => true)

  def health
    h = self.responses.good.count / self.responses.count.to_f * 100.0 rescue 0.0
    h.nan? ? 0.0 : h
  end

end
