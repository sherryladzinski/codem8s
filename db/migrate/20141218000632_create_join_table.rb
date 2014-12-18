class CreateJoinTable < ActiveRecord::Migration
  def change
  	create_table :housing do |t|
      t.integer :city_id
      t.integer :post_id
      t.integer :user_id
  	end
  end
end
