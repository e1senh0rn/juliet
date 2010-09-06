class Website < ActiveRecord::Base
  include Workflow
  
  validates :url, :uniqueness => true, :presence => true
  validates :name, :presence => true
  validates :ttl, :numericality => true, :inclusion => { :in => 0..30 }
  
  belongs_to :user
  has_many :responses, :dependent => :delete_all
  
  scope :enabled, where(:enabled => true)
  
  workflow do
    state :ok do
      event :alert, :transitions_to => :warning
    end
    state :warning do
      event :alert, :transitions_to => :error
      event :recover, :transitions_to => :ok
    end
    state :error do
      event :recover, :transitions_to => :ok
      event :alert, :transitions_to => :error
    end
    on_transition do |from, to, triggering_event, *event_args|
      Notifier.alert(self).deliver if from == :warning and to == :error
    end
  end

  def health
    h = self.responses.good.count / self.responses.count.to_f * 100.0 rescue 0.0
    h.nan? ? 0.0 : h
  end
  
end
