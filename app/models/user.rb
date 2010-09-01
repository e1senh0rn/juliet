class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :role

  validates :full_name, :presence => true
  
  has_many :websites, :dependent => :destroy
  has_many :responses, :through => :websites
  
  ROLES = { :admin => "Admin", :user => "User" }
  
  ROLES.each do |value, _|
    define_method "#{value}?" do
      self.role == value
    end

    scope value.to_s.pluralize.to_sym, where(:role => value.to_s)
  end

  def role
    self[:role] = "user" unless self[:role]
    self[:role].to_sym 
  end

  def role_label
    ROLES[role]
  end

  def to_s
    full_name
  end
  
end
