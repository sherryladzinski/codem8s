class CreateCities < ActiveRecord::Migration
  def change
  	create_table :cities do |t|
      t.string :city_name, null: false
  	end
   
  end
end
