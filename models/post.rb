 class Post < ActiveRecord::Base
 belongs_to :user
  belongs_to :city

  validates :post_content, 
  	:presence => true,
  	:length => { maximum: 500 }
end