
 class City < ActiveRecord::Base
  has_many :users
  has_many :posts, through: :users

  validates :city_name, :presence => true
end