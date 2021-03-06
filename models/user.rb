require "bcrypt"

class User < ActiveRecord::Base
  # attributes
  attr_accessor :password

  # callbacks
  before_save :encrypt_password

  # relationships
  has_many :cities
  has_many :posts

  # validations
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :user_name,
    :presence => true,
    :length => { maximum: 255 }
  validates :email,
    :presence => true,
    :uniqueness => { case_sensitive: false },
    :length => { maximum: 255 },
    :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :program, 
    :presence => true
  validates :housing_preference, 
    :presence => true
  validates :about_me, 
    :presence => true

  # methods
  def authenticate(password)
    if BCrypt::Password.new(self.password_digest) == password
      return self
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      return self.password_digest = BCrypt::Password.create(password)
    end
  end

end