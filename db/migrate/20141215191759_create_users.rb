class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :user_name, null: false
      t.text :email, null: false
      t.text :password, null: false
      t.string :program, null: false
      t.string :housing_preference, null: false
      t.string :about_me, null: false
  	end
  end
end
