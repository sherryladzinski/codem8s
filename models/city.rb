 class City < ActiveRecord::Base
  has_many :users
  has_many :posts through: :users

  validates :name, :presence => true
end