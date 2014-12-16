 class Post < ActiveRecord::Base
  belongs_to :city through: :user 

  validates :post_content, 
  	:presence => true,
  	:length => { maximum: 500 }
  	length: { minimum: 2 }
end