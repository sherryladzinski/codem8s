class CreatePosts < ActiveRecord::Migration
  def change
  	 create_table :posts do |t|
      t.string :post_content, null: false
      t.integer :user_id
  	end
  end
end
